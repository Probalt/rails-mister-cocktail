# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url_ingredient = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
url_cocktail = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'

Ingredient.destroy_all
Cocktail.destroy_all

json_ingredients = open(url_ingredient).read
ingredients = JSON.parse(json_ingredients)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: "#{ingredient['strIngredient1']}")
end

json_cocktails = open(url_cocktail).read
cocktails = JSON.parse(json_cocktails)
cocktails['drinks'].each do |cocktail|
  Cocktail.create(name: "#{cocktail['strDrink']}")
end

Ingredient.all.each do |p|
  puts "Created #{p.name} "
end

Cocktail.all.each do |p|
  puts "Created #{p.name} "
end
