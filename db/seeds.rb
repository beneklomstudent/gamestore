# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.destroy_all
Genre.destroy_all
genres = [
    Genre.create!(genrename: "Shooter"),
    Genre.create!(genrename: "Racing"),
    Genre.create!(genrename: "Sports"),
    Genre.create!(genrename: "Puzzle"),
    Genre.create!(genrename: "Rythm"),
    Genre.create!(genrename: "Platformer"),
    Genre.create!(genrename: "Educational")
]
Game.create!(name: "DoDonPachi")
Game.create!(name: "Cho Aniki")
Game.create!(name: "Donkey Kong Country")
Game.create!(name: "Diddy Kong Racing")