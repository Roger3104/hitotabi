# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'hitotabi@admin',
    password: 'hitotabi'
)

User.create!(
    email: 'testuser@testuser',
    password: 'testuser',
    name: 'testuser'
)

Post.create!(
    title: 'testpost'
)