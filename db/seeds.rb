# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# MANUAL SEEDING
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# SEEDING WITH JSON
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredients is an array of hashes
ingredients = JSON.parse(open(url).read).first[1]

puts 'Cleaning up the database...'
Ingredient.destroy_all
puts 'Creating ingredients...'

ingredients.each_with_index do |ingredient, index| # ingredient is a hash
  Ingredient.create!(
    name: ingredients[index]['strIngredient1']
  )
end

puts "Finished creating #{Ingredient.count} ingredients!"
