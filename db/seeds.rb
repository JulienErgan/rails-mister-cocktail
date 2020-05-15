# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# MANUAL SEEDING for ingredients
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# SEEDING WITH JSON for ingredients names
require 'json'
require 'open-uri'

# CLEANING UP database of cocktails and associated doses
# CLEANING UP database of ingredients - MIND the order of deletion
# we need to delete the cocktails before deleting the ingredients
puts 'Cleaning up the cocktails and the associated doses...'
Cocktail.destroy_all
puts 'Cleaning up the ingredients...'
Ingredient.destroy_all

# PARSING ingredients
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredients is an array of hashes
ingredients = JSON.parse(open(url).read).first[1]

# CREATING ingredients
puts 'Creating the ingredients..'

ingredients.each_with_index do |ingredient, index| # ingredient is a hash
  Ingredient.create!(
    name: ingredients[index]['strIngredient1']
  )
end

puts "Finished creating #{Ingredient.count} ingredients name!"

# CREATING cocktails with 1 image per cocktail and 2 associated doses per cocktail
# upload photo from URL

puts 'Creating the cocktails with attached image and 2 associated doses...'
3.times do
  cocktail = Cocktail.create!(
    name: Faker::Name.first_name
  )
  file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
  cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  2.times do |count|
    Dose.create!(
      description: "#{rand(0..5)} cl",
      cocktail: cocktail,
      ingredient: Ingredient.all[count]
    )
  end
end

puts "Finished creating #{Cocktail.count} cocktails!"
puts "Finished creating #{Dose.count} doses!"
