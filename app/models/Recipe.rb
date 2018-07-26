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
