# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# jon = User.create(name: 'jon', email: 'jon@snow.com')
# rick = User.create(name: 'rick', email: 'rick@sanchez.com')

User.first.add_artwork(title: "not Picasso", image_url: "xnxx.com")
User.first.add_artwork(title: "superman", image_url: "notmarvel.com")
