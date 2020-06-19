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
# 3.times do
#   cocktail = Cocktail.create!(
#     name: Faker::Name.first_name
#   )
#   file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
#   cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#   2.times do |count|
#     Dose.create!(
#       description: "#{rand(0..5)} cl",
#       cocktail: cocktail,
#       ingredient: Ingredient.all[count]
#     )
#   end
# end


# mojito

puts 'Creating the mojito cocktail...'

@mojito = Cocktail.create!(
  name: 'Mojito',
  description: "Mix this classic cocktail for a party using fresh mint, white rum, sugar, zesty lime and cooling soda water. Play with the quantities to suit your taste"
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2013/11/mojito-cocktails.jpg?itok=7ZS6egg_")
@mojito.photo.attach(io: file, filename: 'mojito-cocktails.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "juice of",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "1 lime")
)

Dose.create!(
  description: "1 tsp",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "granulated sugar")
)

Dose.create!(
  description: "small handful",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "mint leaves, plus extra sprig to serve")
)

Dose.create!(
  description: "60ml",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "white rum")
)

puts 'Finished creating the mojito cocktail...'

# Rhubarb gin

puts 'Creating the  Rhubarb gin cocktail...'

@rhubarb_gin = Cocktail.create!(
  name: 'Rhubarb gin',
  description: "Use seasonal rhubarb to make this for a G&T with a difference, or top the finished gin with soda water for a refreshing summertime drink in glorious pink"
)
file = URI.open('https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2017/04/rhubarb-gin.jpg?itok=zbAvKDzl')
@rhubarb_gin.photo.attach(io: file, filename: 'rhubarb-gin.png', content_type: 'image/png')

Dose.create!(
  description: "1kg",
  cocktail: @rhubarb_gin,
  ingredient: Ingredient.new(name: "pink rhubarb stalks")
)

Dose.create!(
  description: "400g",
  cocktail: @rhubarb_gin,
  ingredient: Ingredient.new(name: "caster sugar (don't use golden - it muddies the colour)")
)

Dose.create!(
  description: "800ml",
  cocktail: @rhubarb_gin,
  ingredient: Ingredient.new(name: "gin")
)

puts 'Finished creating the  Rhubarb gin cocktail...'

puts 'Creating the Easy sangria cocktail...'

@easy_sangria = Cocktail.create!(
  name: 'Easy sangria',
  description: "Embrace balmy summer days with a jug of sangria. With red wine, Spanish brandy, sparkling water, cinnamon and chopped fruit, it's a lovely sharing cocktail"
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2019/06/sangria-new-crop.jpg?itok=6R4cpbWs")
@easy_sangria.photo.attach(io: file, filename: 'easy-sangria-cocktails.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "2",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "oranges, chopped")
)

Dose.create!(
  description: "2",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "pears, chopped")
)

Dose.create!(
  description: "2",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "lemons, 1 chopped, 1 juiced")
)

Dose.create!(
  description: "200g",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "red berries, chopped (we used strawberries and cherries)")
)

Dose.create!(
  description: "3 tbsp",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "caster sugar")
)

Dose.create!(
  description: "1 tbsp",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "cinnamom")
)

Dose.create!(
  description: "some",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "ice")
)

Dose.create!(
  description: "750ml",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "bottle light red wine")
)

Dose.create!(
  description: "100ml",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "Spanish brandy")
)

Dose.create!(
  description: "300ml",
  cocktail: @easy_sangria,
  ingredient: Ingredient.new(name: "sparkling water")
)

puts 'Finished creating the Easy sangria cocktail...'

# Espresso martini

puts 'Creating the Espresso martini cocktail...'

@espresso_martini = Cocktail.create!(
  name: 'Espresso martini',
  description: "Learn how to make this classic coffee cocktail. Our easy recipe uses freshly brewed espresso, a dash of coffee liqueur and a simple sugar syrup"
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/12/espresso-martini.jpg?itok=1o0EyNKZ")
@espresso_martini.photo.attach(io: file, filename: 'espresso-martini-cocktails.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "100g",
  cocktail: @espresso_martini,
  ingredient: Ingredient.new(name: "golden caster sugar")
)

Dose.create!(
  description: "some",
  cocktail: @espresso_martini,
  ingredient: Ingredient.new(name: "ice")
)

Dose.create!(
  description: "100ml",
  cocktail: @espresso_martini,
  ingredient: Ingredient.new(name: "vodka")
)

Dose.create!(
  description: "50ml",
  cocktail: @espresso_martini,
  ingredient: Ingredient.new(name: "freshly brewed espresso coffee")
)

Dose.create!(
  description: "50ml",
  cocktail: @espresso_martini,
  ingredient: Ingredient.new(name: "coffee liqueur (we used Kahlua)")
)

Dose.create!(
  description: "4",
  cocktail: @espresso_martini,
  ingredient: Ingredient.new(name: "coffee beans (optional)")
)

puts 'Finished creating the Espresso martini cocktail...'

# New York sour

puts 'Creating the New York sour cocktail...'

@new_york_sour = Cocktail.create!(
  name: 'New York sour',
  description: "Kick back and enjoy a New York sour. With whiskey, red wine, orange bitters and lemon juice, one sip will whisk you away to a Manhattan cocktail bar"
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2020/05/new-york-sour.jpg?itok=i5R2I6JB")
@new_york_sour.photo.attach(io: file, filename: 'new-york-sour-cocktails.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "50ml ",
  cocktail: @new_york_sour,
  ingredient: Ingredient.new(name: "rye whiskey")
)

Dose.create!(
  description: "25ml",
  cocktail: @new_york_sour,
  ingredient: Ingredient.new(name: "lemon juice")
)

Dose.create!(
  description: "2 tsp",
  cocktail: @new_york_sour,
  ingredient: Ingredient.new(name: "maple syrup")
)

Dose.create!(
  description: "dash",
  cocktail: @new_york_sour,
  ingredient: Ingredient.new(name: "orange bitters")
)

Dose.create!(
  description: "1 tbsp",
  cocktail: @new_york_sour,
  ingredient: Ingredient.new(name: "egg white")
)

Dose.create!(
  description: "some",
  cocktail: @new_york_sour,
  ingredient: Ingredient.new(name: "ice")
)

Dose.create!(
  description: "20ml",
  cocktail: @new_york_sour,
  ingredient: Ingredient.new(name: "red wine")
)

puts 'Finished creating the New York sour cocktail...'

# Sex on the beach cocktail

puts 'Creating the Sex on the beach cocktail cocktail...'

@sex_on_the_beach_cocktail = Cocktail.create!(
  name: 'Sex on the beach',
  description: "Combine vodka with peach schnapps and cranberry juice to make a classic sex on the beach cocktail. Garnish with cocktail cherries and orange slices"
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2019/10/sex_on_the_beach.jpg?itok=pa9ciYyf")
@sex_on_the_beach_cocktail.photo.attach(io: file, filename: 'sex-on-the-beach-cocktails.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "50ml",
  cocktail: @sex_on_the_beach_cocktail,
  ingredient: Ingredient.new(name: "vodka")
)

Dose.create!(
  description: "25ml",
  cocktail: @sex_on_the_beach_cocktail,
  ingredient: Ingredient.new(name: "peach schnapps")
)

Dose.create!(
  description: "2",
  cocktail: @sex_on_the_beach_cocktail,
  ingredient: Ingredient.new(name: "oranges, juiced, plus 2 slices to garnish")
)

Dose.create!(
  description: "50ml",
  cocktail: @sex_on_the_beach_cocktail,
  ingredient: Ingredient.new(name: "cranberry juice")
)

Dose.create!(
  description: "glacé cherries",
  cocktail: @sex_on_the_beach_cocktail,
  ingredient: Ingredient.new(name: "to garnish (optional)")
)

puts 'Finished creating the Sex on the beach cocktail cocktail...'

# Pink gin iced tea

puts 'Creating the Pink gin iced tea cocktail...'

@pink_gin_iced_tea_cocktail = Cocktail.create!(
  name: 'Pink gin iced tea',
  description: "Blend pink gin with iced tea and you have this unique cocktail, made with spiced rum, elderflower and pink grapefruit. Serve in a jug for a sharing cocktail "
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2019/10/gin_iced_tea.jpg?itok=RRxkObvp")
@pink_gin_iced_tea_cocktail.photo.attach(io: file, filename: 'pink-gin-ice-tea-cocktails.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "1",
  cocktail: @pink_gin_iced_tea_cocktail,
  ingredient: Ingredient.new(name: "chamomile tea bag")
)

Dose.create!(
  description: "100ml",
  cocktail: @pink_gin_iced_tea_cocktail,
  ingredient: Ingredient.new(name: " pink gin")
)

Dose.create!(
  description: "100ml",
  cocktail: @pink_gin_iced_tea_cocktail,
  ingredient: Ingredient.new(name: "spiced rum")
)

Dose.create!(
  description: "100ml",
  cocktail: @pink_gin_iced_tea_cocktail,
  ingredient: Ingredient.new(name: "elderflower cordial")
)

Dose.create!(
  description: "100ml",
  cocktail: @pink_gin_iced_tea_cocktail,
  ingredient: Ingredient.new(name: "pink grapefruit juice")
)

Dose.create!(
  description: "thyme sprigs",
  cocktail: @pink_gin_iced_tea_cocktail,
  ingredient: Ingredient.new(name: "to garnish")
)

Dose.create!(
  description: "some",
  cocktail: @pink_gin_iced_tea_cocktail,
  ingredient: Ingredient.new(name: "ice")
)

puts 'Finished creating the Pink gin iced tea cocktail...'

# Hurricane cocktail

puts 'Creating the Hurricane cocktail cocktail...'

@hurricane = Cocktail.create!(
  name: 'Hurricane',
  description: "Our tropical, rum-based hurricane cocktail is easy to make and sure to get your party started. Garnish with orange and cocktail cherries for a kitsch touch"
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2019/11/hurricane.jpg?itok=SCKR2ZZY")
@hurricane.photo.attach(io: file, filename: 'hurricane-cocktail.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "50ml",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: " dark rum")
)

Dose.create!(
  description: "50ml",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "white rum")
)

Dose.create!(
  description: "1",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "passion fruit")
)

Dose.create!(
  description: "1",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "orange, juiced")
)

Dose.create!(
  description: "1",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "lemon, juiced")
)

Dose.create!(
  description: "50ml",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "sugar syrup")
)

Dose.create!(
  description: "2tsp",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "grenadine")
)

puts 'Finished creating the Hurricane cocktail...'



# Pink negroni

puts 'Creating the Pink negroni cocktail...'

@pink_negroni = Cocktail.create!(
  name: 'Hurricane',
  description: "Go pink with this fabulous cocktail flavoured with pink gin, rose vermouth and Aperol. Garnish with a wedge of pink grapefruit and a basil leaf to serve"
)
file = URI.open("https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2019/10/classic-negroni.jpg?itok=ZQ8f0t7P")
@hurricane.photo.attach(io: file, filename: 'hurricane-cocktail.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "35ml ",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "pink gin")
)

Dose.create!(
  description: "25ml",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "rose vermouth, or sweet white vermouth")
)

Dose.create!(
  description: "15ml",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "Aperol")
)

Dose.create!(
  description: "some",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "ice")
)

Dose.create!(
  description: "wedge of",
  cocktail: @hurricane,
  ingredient: Ingredient.new(name: "pink grapefruit Grapefruit and a basil leaf, to garnish")
)

puts 'Finished creating the Pink negroni cocktail...'




puts "Finished creating #{Cocktail.count} cocktails!"
puts "Finished creating #{Dose.count} doses!"
