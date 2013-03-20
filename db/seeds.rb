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


Category.attr_accessible :ancestry, :id 


auto = Category.create( name: "Авто", url: "Auto", weight: 0, ancestry: nil, ancestry_depth: 0)
  auto_items = Category.create([
    { name: "Авто аксесуары", url: "avtoaksessuary", weight: 0, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Автосервисы, СТО", url: "avtoservisy", weight: 1, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Автозапчасти", url: "avtozapchasti", weight: 3, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Автомойки", url: "avtomoyki", weight: 4, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Автостоянки", url: "avtostoyanki", weight: 5, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Автосалоны", url: "avtosalony", weight: 6, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Автошколы", url: "avtoshkoly", weight: 7, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Заправки", url: "zapravki", weight: 8, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Прокат автомобилей", url: "prokat-avto", weight: 9, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Техосмотр", url: "tekhosmotr", weight: 10, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Шиномонтаж", url: "shinomontazh", weight: 11, ancestry: auto.id, ancestry_depth: 1 },
    { name: "Эвакуатор", url: "evakuator", weight: 12, ancestry: auto.id, ancestry_depth: 1 },
  ])

shop = Category.create( name: "Магазины", url: "magaziny", weight: 1, ancestry: nil, ancestry_depth: 0)
  shop_items = Category.create([
    { name: "Супермаркеты, универмаги", url: "supermarket", weight: 0, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Рынки", url: "rinki", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
  ])

entertainment = Category.create( name: "Развлечения", url: "razvlecheniya", weight: 2, ancestry: nil, ancestry_depth: 0)
  entertainment_items = Category.create([
    { name: "Кафе", url: "kafe", weight: 0, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Рестораны", url: "restorany", weight: 1, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Бары", url: "bary", weight: 2, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Пиццерии", url: "pitstserii", weight: 3, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Бильярд", url: "bilyard", weight: 4, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Боулинг", url: "bouling", weight: 5, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Казино, игровые залы", url: "kazino", weight: 6, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Кинотеатры", url: "kinoteatry", weight: 7, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Пейнтбол, Лазертаг", url: "lazertag", weight: 8, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Ночные клубы", url: "nochnyye-kluby", weight: 9, ancestry: entertainment.id, ancestry_depth: 1 },
    { name: "Игры", url: "igry", weight: 10, ancestry: entertainment.id, ancestry_depth: 1 },
  ])

advertising = Category.create( name: "Реклама, дизайн", url: "advertising-design", weight: 3, ancestry: nil, ancestry_depth: 0)
  advertising_items = Category.create([
    { name: "Копицентры", url: "kopitsentry", weight: 0, ancestry: advertising.id, ancestry_depth: 1 },
    { name: "Типографии", url: "tipografii", weight: 1, ancestry: advertising.id, ancestry_depth: 1 },
    { name: "Материалы для рекламы", url: "materialy-dlya-reklamy", weight: 2, ancestry: advertising.id, ancestry_depth: 1 },
    { name: "Изготовление наружной рекламы", url: "izgotovleniye-naruzhnoy-reklamy", weight: 3, ancestry: advertising.id, ancestry_depth: 1 },
    { name: "Дизайн cтудии", url: "dizayn-ctudii", weight: 4, ancestry: advertising.id, ancestry_depth: 1 },
    { name: "Рекламные агентства", url: "reklamnyye-agentstva", weight: 5, ancestry: advertising.id, ancestry_depth: 1 },
    { name: "Размещение рекламы", url: "razmeshcheniye-reklamy", weight: 6, ancestry: advertising.id, ancestry_depth: 1 },
  ])

childrens = Category.create( name: "Детский мир", url: "childrens", weight: 4, ancestry: nil, ancestry_depth: 0)

construction = Category.create( name: "Строительство и Ремонт", url: "construction", weight: 5, ancestry: nil, ancestry_depth: 0)
