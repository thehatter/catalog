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

den = User.new do |u|
  u.username = "den"
  u.email = 'andrewlutenko@gmail.com'
  u.password = 'ngiklg'
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
    { name: "Рынки", url: "rynki", weight: 0, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Зоомагазины", url: "zoomagaziny", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Электроника, Бытовая техника", url: "elektronika-bytovaya-tekhnika", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Компьютеры, ноутбуки", url: "kompyutery-noutbuki", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Алкогольные напитки", url: "alkogolnyye-napitki", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Телефоны", url: "telefony", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Канцтовары, книги", url: "kantstovary-knigi", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Секонд-хэнд", url: "sekond-khend", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Бельё", url: "belyo", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Косметика, парфюмерия, бытовая химия", url: "kosmetika-parfyumeriya-bytovaya-khimiya", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Музыкальные инструменты", url: "musical-instruments", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Инструменты", url: "instrumenty", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Обувь", url: "obuvʹ", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Одежда", url: "odezhda", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Охота и рыбалка", url: "okhota-i-rybalka", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Подарки и сувениры", url: "podarki-i-suveniry", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Продукты", url: "produkty", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Хозтовары, Промтовары", url: "khoztovary-promtovary", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Сумки, ремни, галантерея", url: "sumki-remni-galantereya", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Спецодежда", url: "spetsodezhda", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Спортивные товары", url: "sportivnyye-tovary", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Ткани и фурнитура, швейная техника", url: "tkani-i-furnitura-shveynaya-tekhnika", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Товары оптом", url: "tovary-optom", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Цветы", url: "tsvety", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
    { name: "Ювелирные изделия", url: "yuvelirnyye-izdeliya", weight: 1, ancestry: shop.id, ancestry_depth: 1 },
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
  childrens_items = Category.create([
    { name: "Детские Сады", url: "detskie-sady", weight: 0, ancestry: childrens.id, ancestry_depth: 1 },
    { name: "Детские товары", url: "detskie-tovary", weight: 1, ancestry: childrens.id, ancestry_depth: 1 },
    { name: "Игрушки", url: "igrushki", weight: 2, ancestry: childrens.id, ancestry_depth: 1 },
    { name: "Детские студии, кружки", url: "detskie-studii", weight: 3, ancestry: childrens.id, ancestry_depth: 1 },
  ])


construction = Category.create( name: "Строительство и Ремонт", url: "construction", weight: 5, ancestry: nil, ancestry_depth: 0)
  construction_items = Category.create([
    { name: "Дизайн интерьера", url: "dizajn_interera", weight: 0, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Стройматериалы", url: "stroymaterialy", weight: 1, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Бани, срубы", url: "bani-sruby", weight: 2, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Металлоконструкции", url: "metallokonstruktsii", weight: 3, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Окна, Двери, Балконы", url: "okna-dveri-balkony", weight: 4, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Плитка, Ламинат, Линолеум", url: "plitka-laminat-linoleum", weight: 5, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Натяжные потолки", url: "natyazhnyye-potolki", weight: 6, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Краски, лаки", url: "kraski-laki", weight: 7, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Строительное оборудование", url: "stroitelnoye-oborudovaniye", weight: 8, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Строительные организации", url: "Stroitelnyye-organizatsii", weight: 9, ancestry: construction.id, ancestry_depth: 1 },
    { name: "Проектные организации", url: "proyektnyye-organizatsii", weight: 10, ancestry: construction.id, ancestry_depth: 1 },
  ])

house = Category.create( name: "Дом", url: "house", weight: 5, ancestry: nil, ancestry_depth: 0)
  house_items = Category.create([
    { name: "Зеркала", url: "zerkala", weight: 0, ancestry: house.id, ancestry_depth: 1 },
    { name: "Посуда", url: "posuda", weight: 1, ancestry: house.id, ancestry_depth: 1 },
    { name: "Мебель и кухни", url: "mebel_kukhni", weight: 2, ancestry: house.id, ancestry_depth: 1 },
    { name: "Шторы, Жалюзи", url: "shtory-zhalyuzi", weight: 3, ancestry: house.id, ancestry_depth: 1 },
    { name: "Доставка питьевой воды", url: "dostavka-vody", weight: 4, ancestry: house.id, ancestry_depth: 1 },
    { name: "Сантехника", url: "santekhnika", weight: 5, ancestry: house.id, ancestry_depth: 1 },
    { name: "Дача, огород", url: "dacha-ogorod", weight: 6, ancestry: house.id, ancestry_depth: 1 },
    { name: "Ворота заборы", url: "vorota-zabory", weight: 7, ancestry: house.id, ancestry_depth: 1 },
    { name: "Кондиционеры, вентиляторы", url: "konditsionery-ventilyatory", weight: 8, ancestry: house.id, ancestry_depth: 1 },
    { name: "Отопительное оборудование", url: "otopitelnoye-oborudovaniye", weight: 9, ancestry: house.id, ancestry_depth: 1 },
    { name: "Лампы, Люстры, Светильники", url: "lampy-lyustry-svetilniki", weight: 10, ancestry: house.id, ancestry_depth: 1 },
    { name: "Интерьер", url: "interyer", weight: 11, ancestry: house.id, ancestry_depth: 1 },
  ])

real_estate = Category.create( name: "Недвижимость", url: "real_estate", weight: 4, ancestry: nil, ancestry_depth: 0)
  real_estate_items = Category.create([
    { name: "Аренда квартир, домов", url: "arenda-kvartir", weight: 0, ancestry: real_estate.id, ancestry_depth: 1 },
    { name: "Аренда помещений", url: "arenda-pomeshcheniy", weight: 1, ancestry: real_estate.id, ancestry_depth: 1 },
    { name: "Агентства недвижимости", url: "agentstva-nedvizhimosti", weight: 2, ancestry: real_estate.id, ancestry_depth: 1 },
  ])

information_technology = Category.create( name: "Информационные технологии", url: "information_technology", weight: 4, ancestry: nil, ancestry_depth: 0)
  information_technology_items = Category.create([
    { name: "Програмное обеспечение", url: "software", weight: 0, ancestry: information_technology.id, ancestry_depth: 1 },
    { name: "Создание сайтов", url: "sozdaniye-saytov", weight: 1, ancestry: information_technology.id, ancestry_depth: 1 },
    { name: "Хостинг", url: "hosting", weight: 2, ancestry: information_technology.id, ancestry_depth: 1 },
    { name: "Маркетинг и консалтинг", url: "marketing-consulting", weight: 3, ancestry: information_technology.id, ancestry_depth: 1 },
  ])


beauty = Category.create( name: "Красота", url: "beauty", weight: 4, ancestry: nil, ancestry_depth: 0)
  beauty_items = Category.create([
    { name: "Косметология", url: "kosmetologiya", weight: 0, ancestry: beauty.id, ancestry_depth: 1 },
    { name: "Парикмахерские", url: "parikmakherskiye", weight: 1, ancestry: beauty.id, ancestry_depth: 1 },
    { name: "Салоны красоты", url: "salony-krasoty", weight: 2, ancestry: beauty.id, ancestry_depth: 1 },
    { name: "Солярии", url: "solyarii", weight: 3, ancestry: beauty.id, ancestry_depth: 1 },
    { name: "Тату-салоны", url: "tatu-salony", weight: 4, ancestry: beauty.id, ancestry_depth: 1 },
  ])

recreation = Category.create( name: "Отдых и туризм", url: "recreation&tourism", weight: 4, ancestry: nil, ancestry_depth: 0)
  recreation_items = Category.create([
    { name: "Базы отдыха", url: "bazy-otdykha", weight: 0, ancestry: recreation.id, ancestry_depth: 1 },
    { name: "Бани и сауны", url: "bani-i-sauny", weight: 1, ancestry: recreation.id, ancestry_depth: 1 },
    { name: "Санатории", url: "sanatorii", weight: 2, ancestry: recreation.id, ancestry_depth: 1 },
    { name: "Гостиницы и отели", url: "gostinitsy-oteli", weight: 3, ancestry: recreation.id, ancestry_depth: 1 },
    { name: "Турфирмы", url: "turfirmy", weight: 4, ancestry: recreation.id, ancestry_depth: 1 },
  ])

holidays = Category.create( name: "Праздники, Мероприятия", url: "holidays&activity", weight: 4, ancestry: nil, ancestry_depth: 0)
  holidays_items = Category.create([
    { name: "Свадебные салоны", url: "svadebnyye-salony", weight: 0, ancestry: holidays.id, ancestry_depth: 1 },
    { name: "Фото, видеосъемка", url: "foto-video", weight: 1, ancestry: holidays.id, ancestry_depth: 1 },
    { name: "Праздничные агентства", url: "prazdnichnyye-agentstva", weight: 2, ancestry: holidays.id, ancestry_depth: 1 },
  ])

medicine = Category.create( name: "Медицина", url: "medicine", weight: 5, ancestry: nil, ancestry_depth: 0)
  medicine_items = Category.create([
    { name: "Аптеки", url: "apteki", weight: 0, ancestry: medicine.id, ancestry_depth: 1 },
    { name: "Медицинские центры", url: "meditsinskiye-tsentry", weight: 1, ancestry: medicine.id, ancestry_depth: 1 },
    { name: "Оптика", url: "optika", weight: 2, ancestry: medicine.id, ancestry_depth: 1 },
    { name: "Медицинские магазины", url: "meditsinskiye-magaziny", weight: 3, ancestry: medicine.id, ancestry_depth: 1 },
    { name: "Поликлиники и больницы", url: "polikliniki-bolnitsy", weight: 4, ancestry: medicine.id, ancestry_depth: 1 },
    { name: "Роддома и женские консультации", url: "roddoma", weight: 5, ancestry: medicine.id, ancestry_depth: 1 },
    { name: "Стоматология", url: "stomatologiya", weight: 6, ancestry: medicine.id, ancestry_depth: 1 },
    { name: "Ветеринарные клиники", url: "veterinarnyye_kliniki", weight: 7, ancestry: medicine.id, ancestry_depth: 1 },
  ])

government = Category.create( name: "Государственные организации", url: "government", weight: 5, ancestry: nil, ancestry_depth: 0)
  government_items = Category.create([
    { name: "Витебский облисполком", url: "vitebskiy-oblispolkom", weight: 0, ancestry: government.id, ancestry_depth: 1 },
    { name: "Витебский горисполком", url: "vitebskiy-gorispolkom", weight: 1, ancestry: government.id, ancestry_depth: 1 },
    { name: "Витебский раисполком", url: "vitebskiy-raispolkom", weight: 2, ancestry: government.id, ancestry_depth: 1 },
    { name: "ЖКХ", url: "zhkh", weight: 3, ancestry: government.id, ancestry_depth: 1 },
    { name: "ЗАГСы", url: "zagsy", weight: 4, ancestry: government.id, ancestry_depth: 1 },
    { name: "Коммунальные предприятия", url: "kommunalnyye-predpriyatiya", weight: 5, ancestry: government.id, ancestry_depth: 1 },
    { name: "Налоговые инспекции", url: "nalogovyye-inspektsii", weight: 6, ancestry: government.id, ancestry_depth: 1 },
    { name: "Правоохранительные органы", url: "pravookhranitelnyye-organy", weight: 7, ancestry: government.id, ancestry_depth: 1 },
    { name: "Социальная защита", url: "sotsialnaya-zashchita", weight: 8, ancestry: government.id, ancestry_depth: 1 },
  ])

industry = Category.create( name: "Промышленность и сельское хозяйство", url: "industry", weight: 5, ancestry: nil, ancestry_depth: 0)
  industry_items = Category.create([
    { name: "Деревообработка", url: "derevoobrabotka", weight: 0, ancestry: industry.id, ancestry_depth: 1 },
    { name: "Легкая промышленность", url: "legkaya-promyshlennost", weight: 1, ancestry: industry.id, ancestry_depth: 1 },
    { name: "Пищевая промышленность", url: "pishchevaya-promyshlennost", weight: 2, ancestry: industry.id, ancestry_depth: 1 },
    { name: "Машиностроение", url: "mashinostroyeniye", weight: 3, ancestry: industry.id, ancestry_depth: 1 },
    { name: "Приборостроение", url: "priborostroyeniye", weight: 4, ancestry: industry.id, ancestry_depth: 1 },
    { name: "Сельскохозяйственная деятельность", url: "selskokhozyaystvennaya-deyatelnost", weight: 5, ancestry: industry.id, ancestry_depth: 1 },
    { name: "Сельскохозяйственные предприятия", url: "selskokhozyaystvennyye-predpriyatiya", weight: 6, ancestry: industry.id, ancestry_depth: 1 },
  ])

media = Category.create( name: "СМИ", url: "media", weight: 4, ancestry: nil, ancestry_depth: 0)
  media_items = Category.create([
    { name: "Газеты и журналы", url: "gazety-zhurnaly", weight: 0, ancestry: media.id, ancestry_depth: 1 },
    { name: "Радио", url: "radio", weight: 1, ancestry: media.id, ancestry_depth: 1 },
    { name: "Телевидение", url: "televideniye", weight: 2, ancestry: media.id, ancestry_depth: 1 },
    { name: "Новостные сайты", url: "novostnyye-sayty", weight: 3, ancestry: media.id, ancestry_depth: 1 },
  ])

transport = Category.create( name: "Транспорт", url: "transport", weight: 4, ancestry: nil, ancestry_depth: 0)
  transport_items = Category.create([
    { name: "Такси", url: "taksi", weight: 0, ancestry: transport.id, ancestry_depth: 1 },
    { name: "Грузоперевозки", url: "gruzoperevozki", weight: 1, ancestry: transport.id, ancestry_depth: 1 },
    { name: "Пассажирские перевозки", url: "passazhirskiye-perevozki", weight: 2, ancestry: transport.id, ancestry_depth: 1 },
    { name: "Вокзалы", url: "vokzaly", weight: 3, ancestry: transport.id, ancestry_depth: 1 },
    { name: "Общественный транспорт", url: "obshchestvennyy-transport", weight: 4, ancestry: transport.id, ancestry_depth: 1 },
  ])

communication = Category.create( name: "Связь", url: "communication", weight: 4, ancestry: nil, ancestry_depth: 0)
  communication_items = Category.create([
    { name: "Интернет провайдеры", url: "internet-provaydery", weight: 0, ancestry: communication.id, ancestry_depth: 1 },
    { name: "Почта", url: "pochta", weight: 1, ancestry: communication.id, ancestry_depth: 1 },
    { name: "Кабельное ТВ", url: "cable-tv", weight: 2, ancestry: communication.id, ancestry_depth: 1 },
    { name: "Сотовые операторы", url: "sotovyye-operatory", weight: 3, ancestry: communication.id, ancestry_depth: 1 },
    { name: "Телефоны (город)", url: "telefony-gorod", weight: 4, ancestry: communication.id, ancestry_depth: 1 },
  ])

domestic_services = Category.create( name: "Бытовые Услуги", url: "domestic_services", weight: 5, ancestry: nil, ancestry_depth: 0)
  domestic_services_items = Category.create([
    { name: "Багетные мастерские", url: "bagetnyye-masterskiye", weight: 0, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Прокат", url: "prokat", weight: 1, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Ремонт обуви", url: "remont-obuvi", weight: 2, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Ритуальные услуги", url: "ritualnyye-uslugi", weight: 3, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Химчистки", url: "khimchistki", weight: 4, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Швейные ателье", url: "shveynyye-atelye", weight: 5, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Вскрытие замков", url: "vskrytiye-zamkov", weight: 6, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Клининг и уборка", url: "klining-uborka", weight: 7, ancestry: domestic_services.id, ancestry_depth: 1 },
    { name: "Прочие услуги", url: "other-services", weight: 8, ancestry: domestic_services.id, ancestry_depth: 1 },
  ])

finance = Category.create( name: "Финансы", url: "finance", weight: 5, ancestry: nil, ancestry_depth: 0)
  finance_items = Category.create([
    { name: "Банки", url: "banki", weight: 0, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Банкоматы", url: "bankomaty", weight: 1, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Бухгалтерские и консалтинговые услуги", url: "bukhgalterskiye-i-konsaltingovyye-uslugi", weight: 2, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Ломбарды", url: "lombardy", weight: 3, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Страховые компании", url: "strakhovyye-kompanii", weight: 4, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Финансовые услуги", url: "finansovyye-uslugi", weight: 5, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Аудиторские услуги", url: "auditorskiye-uslugi", weight: 6, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Бухгалтерские услуги", url: "bukhgalterskiye-uslugi", weight: 7, ancestry: finance.id, ancestry_depth: 1 },
    { name: "Экспертная оценка и экспертиза", url: "ekspertnaya-otsenka", weight: 8, ancestry: finance.id, ancestry_depth: 1 },
  ])

business_services = Category.create( name: "Бизнес Услуги", url: "business_services", weight: 5, ancestry: nil, ancestry_depth: 0)
  business_services_items = Category.create([
    { name: "Бюро переводов", url: "byuro-perevodov", weight: 0, ancestry: business_services.id, ancestry_depth: 1 },
    { name: "Юридические услуги", url: "yuridicheskiye-uslugi", weight: 1, ancestry: business_services.id, ancestry_depth: 1 },
    { name: "Нотариальные услуги", url: "notarialnyye-uslugi", weight: 2, ancestry: business_services.id, ancestry_depth: 1 },
    { name: "Бизнес-центры", url: "biznes-tsentry", weight: 3, ancestry: business_services.id, ancestry_depth: 1 },
  ])

service = Category.create( name: "Сервис", url: "service", weight: 5, ancestry: nil, ancestry_depth: 0)
  service_items = Category.create([
    { name: "Ремонт мобильных телефонов", url: "remont-telefonov", weight: 0, ancestry: service.id, ancestry_depth: 1 },
    { name: "Ремонт компьютеров, ноутбуков и оргтехники", url: "restorany", weight: 1, ancestry: service.id, ancestry_depth: 1 },
    { name: "Ремонт и обслуживание техники", url: "remont kompyuterov", weight: 2, ancestry: service.id, ancestry_depth: 1 },
    { name: "Ремонт часов, изготовление ключей", url: "remont-chasov-izgotovleniye-klyuchey", weight: 3, ancestry: service.id, ancestry_depth: 1 },
  ])

society = Category.create( name: "Общество и Религия", url: "society", weight: 5, ancestry: nil, ancestry_depth: 0)
  society_items = Category.create([
    { name: "Религиозные организации", url: "religioznyye-organizatsii", weight: 0, ancestry: society.id, ancestry_depth: 1 },
    { name: "Общественные объединения", url: "obshchestvennyye-obyedineniya", weight: 1, ancestry: society.id, ancestry_depth: 1 },
    { name: "Профессиональные союзы, ассоциации", url: "professionalnyye-soyuzy-assotsiatsii", weight: 2, ancestry: society.id, ancestry_depth: 1 },
  ])

art = Category.create( name: "Культура и искусство", url: "art", weight: 5, ancestry: nil, ancestry_depth: 0)
  art_items = Category.create([
    { name: "Художники", url: "hudozhniki", weight: 0, ancestry: art.id, ancestry_depth: 1 },
    { name: "Концертные залы", url: "kontsertnyye-zaly", weight: 1, ancestry: art.id, ancestry_depth: 1 },
    { name: "Выставочные залы, галереи", url: "vystavochnyye-zaly-galerei", weight: 2, ancestry: art.id, ancestry_depth: 1 },
    { name: "Музеи", url: "muzei", weight: 3, ancestry: art.id, ancestry_depth: 1 },
    { name: "Театры", url: "teatry", weight: 4, ancestry: art.id, ancestry_depth: 1 },
  ])

education = Category.create( name: "Образование", url: "education", weight: 5, ancestry: nil, ancestry_depth: 0)
  education_items = Category.create([
    { name: "Высшие учебные заведения", url: "vysshiye-uchebnyye-zavedeniya", weight: 0, ancestry: education.id, ancestry_depth: 1 },
    { name: "Средние специальные учебные заведения", url: "sredniye-spetsialnyye-uchebnyye-zavedeniya", weight: 1, ancestry: education.id, ancestry_depth: 1 },
    { name: "Школы и гимназии", url: "shkoly-i-gimnazii", weight: 2, ancestry: education.id, ancestry_depth: 1 },
    { name: "Обучение, образование, курсы", url: "obucheniye-obrazovaniye-kursy", weight: 3, ancestry: education.id, ancestry_depth: 1 },
  ])