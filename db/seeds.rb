# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Product.delete_all
User.delete_all
3.times do
    user = User.create! email: Faker::Internet.email, password:'password'
    puts "Created a new user: #{user.email}"
    2.times do
        product = Product.create!(
        tittle: Faker::Commerce.product_name,
        price: rand(1.0..100.0),
        published: true,
        user_id: user.id
        )
        puts "Created a brand new product: #{product.tittle}"
    end
end
