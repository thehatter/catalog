# -*- encoding: utf-8 -*-
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


Category.attr_accessible :ancestry

Categories = Category.create([
  { name: "Авто", url: "Auto", weight: 0, ancestry: nil, ancestry_depth: 0 }, 
    { name: "Авто аксесуары", url: "avtoaksessuary", weight: 0, ancestry: "1", ancestry_depth: 1 },
    { name: "Автосервисы, СТО", url: "avtoservisy", weight: 1, ancestry: "1", ancestry_depth: 1 },

  { name: "Магазины", url: "magaziny", weight: 1, ancestry: nil, ancestry_depth: 0 },
])