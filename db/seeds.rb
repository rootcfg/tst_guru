# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Category.create(title: "Sport")
b = Category.create(title: "Autos")
c = Category.create(title: "Bikes")
d = Category.create(title: "Planes")
e = Category.create(title: "Trains")

cats = [a,b,c,d,e]
u = User.create(username: "Alex")

Test.create(title: "About #{cats.sample.title}", level: rand(4), user_id: u.id, category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), user_id: u.id, category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), user_id: u.id, category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), user_id: u.id, category_id: cats.sample.id)
Test.create(title: "About #{cats.sample.title}", level: rand(4), user_id: u.id, category_id: cats.sample.id)