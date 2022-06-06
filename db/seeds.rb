# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all


#10.times do
#user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, adress_1: Faker::Address.street_address, adress_2: Faker::Address.secondary_address, postal_code: Faker::Address.zip_code, city: Faker::Address.city, email: Faker::Internet.email, password_encrypted: Faker::Internet.password)
#end

20.times do
    item = Item.create(
        title: Faker::Artist.unique.name,
        description: Faker::Creature::Cat.breed,
        price: Faker::Number.decimal(l_digits: 2),
       img_url: Faker::LoremFlickr.image(size: "320x240", search_terms: ['kitten']))
end

