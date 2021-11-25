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
    Genre.create!(genre: "Shooter"),
    Genre.create!(genre: "Sports"),
    Genre.create!(genre: "Platformer"),
    Genre.create!(genre: "Puzzle"),
    Genre.create!(genre: "Fighting"),
    Genre.create!(genre: "Beat Em Up"),

]

Game.create!(name: "DoDonPachi", genre: [genres[0]])
