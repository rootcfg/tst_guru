# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = Category.create([{title: "Sport"},{title: "Autos"},{title: "Bikes"},{title: "Planes"},{title: "Trains"}])
u = User.create(username: "Alex")

Test.create(title: "About #{cats.sample.title}", level: rand(4), category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), category_id: cats.sample.id)