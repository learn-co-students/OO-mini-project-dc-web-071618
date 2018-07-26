require_relative '../config/environment.rb'

#Recipe
r1 = Recipe.new("Spinach")
r2 = Recipe.new("Broccoli")
r3 = Recipe.new("Birthday Cake")
r4 = Recipe.new("Spaghetti")
r5 = Recipe.new("Bread")
r6 = Recipe.new("Pecan pie")

#User
u1 = User.new("Alex")
u2 = User.new("Brandon")
u3 = User.new("Cate")
u4 = User.new("David")
u5 = User.new("Ethan")

#Recipe Card(name, recipe, user, date, rating)
rc1 = RecipeCard.new("rc1", r1, u1, Time.now, 1)
rc2 = RecipeCard.new("rc2", r2, u2, Time.now, 2)
rc3 = RecipeCard.new("rc3", r3, u2, Time.now, 3)
rc4 = RecipeCard.new("rc4", r4, u2, Time.now, 4)
rc5 = RecipeCard.new("rc5", r5, u5, Time.now, 5)
rc6 = RecipeCard.new("rc6", r6, u5, Time.now, 5)
#rc5 = RecipeCard.new("rc5", r5, u2, Time.now, 1)

i1 = Ingredient.new("almond")
i2 = Ingredient.new("peanut")
i3 = Ingredient.new("water")
i4 = Ingredient.new("flour")
i5 = Ingredient.new("carrots")
i6 = Ingredient.new("pecan")

a1 = Allergen.new("a1", u1, i1)
a2 = Allergen.new("a2", u2, i2)
a3 = Allergen.new("a3", u3, i1)
a4 = Allergen.new("a4", u5, i6)

ri1 = RecipeIngredient.new(r1,i1)
ri2 = RecipeIngredient.new(r1,i3)
ri3 = RecipeIngredient.new(r5,i5)
ri4 = RecipeIngredient.new(r6,i6)

binding.pry
