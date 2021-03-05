# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Populating DB for tests
5.times do |i|
  # Creates new post
  Post.create!(title: "Post #{i+1}", body: "Description #{i+1}")
  # Wait 1 second, for the datetime on created_at column to be different when the next post is created by the loop
  sleep 1
end