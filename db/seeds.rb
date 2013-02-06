# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create([{ username: 'andrew', email:'andrewlutenko@gmail.com', admin: true,  }])

admin = User.new do |u|
  u.username = "andrew"
  u.email = 'andrewlutenko@gmail.com'
  u.password = '123456'
  u.admin = true
end

admin.save!