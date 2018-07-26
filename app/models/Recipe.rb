class Recipe

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


  def self.recipe_frequency
    x = {}
    all.each do |rec|
      x[rec]=rec.users.count
    end
    x
  end

  def self.most_popular
    recipe_frequency.sort_by {|key, value| value}[-1][0]
  end

  def recipe_cards
    RecipeCard.all.select {|a| a.recipe == self}
  end

  def users
    recipe_cards.map {|rc| rc.user}
  end

  def ingredients
    rec_ing = RecipeIngredient.all.select {|a| a.recipe == self}
    rec_ing.map {|ri| ri.ingredient}
  end

  def allergens
    al_ing = Allergen.all.map {|a| a.ingredient}
    ingredients.select {|i| al_ing.include?(i)}
  end

  def add_ingredients(ing_arr)
    ing_arr.each {|i| RecipeIngredient.new(self, i)}
  end

end

#---------------
### `Recipe`
# Build the following methods on the Recipe class
#
# - `Recipe.all`
# should return all of the recipe instances
# - `Recipe.most_popular`
# should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
# - `Recipe#users`
# should return the user instances who have recipe cards with this recipe
# - `Recipe#ingredients`
# should return all of the ingredients in this recipe
# - `Recipe#allergens`
# should return all of the ingredients in this recipe that are allergens
# - `Recipe#add_ingredients`
# should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
