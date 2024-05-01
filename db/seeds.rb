# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'
puts Faker::Name.name #=> "Christophe Bartell"
puts Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"
puts Faker::Lorem.sentence #=> "Dolore illum animi et eum perferendis."

Product.delete_all
#...
10.times do
  title = Faker::Book.title
  description = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
  image_url = Faker::LoremFlickr.image(size: "300x300", search_terms: %w(book portraits saints jesus))
  price = Faker::Commerce.price(range: 10.0..100.0)

  Product.create!(
    title: title,
    description: %{<p>#{description}</p>},
    image_url: image_url,
    price: price
  )
end

#...