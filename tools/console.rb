require_relative '../config/environment.rb'
jeff = User.new(name: "Jeff")
aubree = User.new(name: "Aubree")
rob = User.new(name: "Rob")

nuts = Ingredient.new(name: "nuts")
eggs = Ingredient.new(name: "eggs")
flour = Ingredient.new(name: 'flour')

r1 = Recipe.new(name: 'Cake')
r2 = Recipe.new(name: 'Pie')
r3 = Recipe.new(name: 'Omelette')

rc1 = RecipeCard.new(user: jeff, recipe: r1, date: Time.now, rating: 5.0)
rc2 = RecipeCard.new(user: aubree, recipe: r2, date: Time.now, rating: 4.0)
rc3 = RecipeCard.new(user: rob, recipe: r3, date: Time.now, rating: 3.0)
rc4 = RecipeCard.new(user: jeff, recipe: r2, date: Time.now, rating: 3.5)
rc5 = RecipeCard.new(user: jeff, recipe: r3, date: Time.now, rating: 2.0)
rc6 = RecipeCard.new(user: aubree, recipe: r3, date: Time.now, rating: 5.0)

ri1 = RecipeIngredient.new(recipe: r1, ingredient: nuts)
ri2 = RecipeIngredient.new(recipe: r2, ingredient: eggs)
ri3 = RecipeIngredient.new(recipe: r3, ingredient: flour)

a1 = Allergen.new(user: jeff, ingredient: nuts)
a2 = Allergen.new(user: aubree, ingredient: flour)
a3 = Allergen.new(user: rob, ingredient: eggs)

binding.pry
