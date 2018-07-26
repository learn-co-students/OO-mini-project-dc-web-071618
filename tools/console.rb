require_relative '../config/environment.rb'

jen = User.new("Jennifer")
jon = User.new("Jonathan")

brownies = Recipe.new("brownies")
cookies = Recipe.new("cookies")

RecipeCard.new(jen, brownies, "2014.07.23", 10)
RecipeCard.new(jon, brownies, "2016.01.03", 3)
RecipeCard.new(jen, cookies, "2016.08.08", 8)
RecipeCard.new(jen, brownies, "2018.01.01", 1)

sugar = Ingredient.new("sugar")
nuts = Ingredient.new("nuts")
flour = Ingredient.new("flour")
cocoa = Ingredient.new("cocoa powder")
butter = Ingredient.new("2 sticks butter")

RecipeIngredient.new(brownies, sugar)
RecipeIngredient.new(brownies, nuts)
# RecipeIngredient.new(brownies, sugar)
# RecipeIngredient.new(brownies, sugar)
# RecipeIngredient.new(brownies, sugar)

Allergen.new(jen, nuts)
Allergen.new(jen, sugar)
Allergen.new(jen, butter)
Allergen.new(jon, flour)
Allergen.new(jon, nuts)


binding.pry
