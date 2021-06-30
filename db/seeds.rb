# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{title: "Sport"},{title: "Autos"},{title: "Bikes"},{title: "Planes"},{title: "Trains"}])
u = User.create(username: "Alex")

Test.create(title: "About #{categories.sample.title}", level: rand(4), category_id: categories.sample.id, author_id: rand(1..User.all.size))
Test.create(title: "About #{categories.sample.title}", level: rand(4), category_id: categories.sample.id, author_id: rand(1..User.all.size))
Test.create(title: "About #{categories.sample.title}", level: rand(4), category_id: categories.sample.id, author_id: rand(1..User.all.size))
Test.create(title: "About #{categories.sample.title}", level: rand(4), category_id: categories.sample.id, author_id: rand(1..User.all.size))
Test.create(title: "About #{categories.sample.title}", level: rand(4), category_id: categories.sample.id, author_id: rand(1..User.all.size))