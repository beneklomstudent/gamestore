
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
    Genre.create!(genrename: "other")
]

Game.create!(name: "DoDonPachi")
Game.create!(name: "Cho Aniki")
Game.create!(name: "Donkey Kong Country")
Game.create!(name: "Diddy Kong Racing")