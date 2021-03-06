# Automatically precompile assets
load "deploy/assets"
 
# Execute "bundle install" after deploy, but only when really needed
require "bundler/capistrano"
 
# RVM integration
require "rvm/capistrano"


# Application name
set :application, "catalog"


# Deploy username and sudo username
set :user, "andrew"
set :user_rails, "andrew"
 
# App Domain
set :domain, "andrew@178.124.130.11"

# We don't want to use sudo (root) - for security reasons
set :use_sudo, false


# Target ruby version
set :rvm_ruby_string, 'ruby-1.9.3-p392'


# RVM installation
set :rvm_type, :user



# git is our SCM
set :scm, :git

# Use github repository
set :repository,  "git://github.com/thehatter/catalog.git"

# master is our default git branch
set :branch, "master"

# Deploy via github
set :deploy_via, :remote_cache
set :deploy_to, "/home/andrew/apps/#{application}"


role :web, domain
role :app, domain
role :db,  domain, :primary => true

# We have all components of the app on the same server
server domain, :app, :web, :db, :primary => true
 
# Install RVM and Ruby before deploy
before "deploy:setup", "rvm:install_rvm"
before "deploy:setup", "rvm:install_ruby"
 
# Apply default RVM version for the current account
#after "deploy:setup", "deploy:set_rvm_version"


# Fix log/ and pids/ permissions
after "deploy:setup", "deploy:fix_setup_permissions"
 
# Unicorn config
set :unicorn_config, "#{current_path}/config/unicorn.conf.rb"
set :unicorn_binary, "bundle exec unicorn_rails -c #{unicorn_config} -E #{rails_env} -D"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"


namespace :deploy do

  task :start, :roles => :app, :except => { :no_release => true } do
    # Start unicorn server using sudo (rails)
    run "cd #{current_path} && #{unicorn_binary}"
  end
 
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill `cat #{unicorn_pid}`; fi"
  end
 
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill -s QUIT `cat #{unicorn_pid}`; fi"
  end
 
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill -s USR2 `cat #{unicorn_pid}`; fi"
  end
 
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end

  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end


  task :fix_setup_permissions, :roles => :app, :except => { :no_release => true } do
    run "chgrp #{user_rails} #{shared_path}/log"
    run "chgrp #{user_rails} #{shared_path}/pids"
  end

#  task :set_rvm_version, :roles => :app, :except => { :no_release => true } do
#    run "$HOME/.rvm/bin/rvm-shell use #{rvm_ruby_string} --default"
 # end

 # Precompile assets only when needed
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      # If this is our first deploy - don't check for the previous version
      if remote_file_exists?(current_path)
        from = source.next_revision(current_revision)
        if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
          run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
        else
          logger.info "Skipping asset pre-compilation because there were no asset changes"
        end
      else
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      end
    end
  end

end

# Helper function
def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end