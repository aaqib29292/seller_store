# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'faker'

def dot
  print '.'
end

def seed_customer(i)
  Customer.find_or_create_by(email: "customer_#{i}@sellerstore.com") do |customer|
    customer.name = Faker::Name.name
    customer.phone = Faker::PhoneNumber.phone_number
    city = Faker::Address.city
    pincode = Faker::Address.zip
    customer.address = "#{Faker::Address.street_address}, #{city}, #{pincode}"
    customer.city = city
    customer.pincode = pincode
  end
  dot
end


puts "# Seeding Customers"
(1..100).each do |i|
  seed_customer(i)
end
puts "  Done."

def seed_product_category(name)
  pc = ProductCategory.find_or_create_by(name: name)
  dot
  return pc
end

puts "# Seeding Products"
(50 - Product.count).times do
  product_name = ""
  while(product_name.blank? || Product.where(name: product_name).any?)
    product_category_name = Faker::Commerce.department(1)
    product_name = Faker::Commerce.product_name
    price = Faker::Commerce.price
    quantity = 21 + rand(10)
  end

  pc = seed_product_category(product_category_name)
  Product.find_or_create_by(name: product_name) do |product|
    product.product_category= pc
    product.price = 10 + price.to_i
    product.quantity = quantity
  end
end
puts "  Done."
