require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_serialized = open(url).read
ingredients_array = JSON.parse(ingredients_serialized)['drinks'].map { |ingredient| ingredient.values.join }

ingredients_array.each do |ingredient|
  Ingredient.create(name: "#{ingredient}")
end
