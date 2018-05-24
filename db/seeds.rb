require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
buffer = open(url).read;
cocktail_ingredient = JSON.parse(buffer);
ingredient_array = cocktail_ingredient["drinks"];


ingredient_array.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts 'Finished!'