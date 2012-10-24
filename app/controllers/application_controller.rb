class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def is_admin?
      current_user.admin?
    end
    
end
