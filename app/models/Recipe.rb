class Recipe

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_popular
    highest = @@all[0] #first instance of recipe
    highestr = 0 #amount of users
    @@all.each do |r|
      if r.recipecards.count > highestr
        highestr = r.recipecards.count
        highest = r
      end
    end
    highest #most popular recipe instance
  end

  def recipeingredients
    RecipeIngredient.all.select {|ri| ri.recipe == self}
  end

  def ingredients
    recipeingredients.map {|ri| ri.ingredient}
  end

  def add_ingredients(array)
    array.each do |x|
      RecipeIngredient.new(self, x)
    end
  end

  def allergens
    ingredients.select {|i| i.allergens.size > 0}
  end

  def recipecards
    RecipeCard.all.select {|rc| rc.recipe == self}
  end

  def users
    recipecards.map {|rc| rc.user}
  end

  def self.all
    @@all
  end

end
