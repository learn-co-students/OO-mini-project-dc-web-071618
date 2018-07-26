class User

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(name, recipe, date, rating)
    RecipeCard.new(name, recipe, self, date, rating)
  end

  def recipecards
    RecipeCard.all.select {|rc| rc.user == self}
  end

  def recipes
    recipecards.map {|rc| rc.recipe}
  end

  def safe_recipes
    user_allergens = self.allergens
    user_recipes = self.recipes

    user_recipes.select do |recipe|
      recipe.ingredients.select do |i|
        i.allergens.select do |a|
          !user_allergens.include?(a)
        end
      end
    end
  end

  def top_three_recipes
    sorted = recipecards.sort_by {|rc| rc.rating}
    sorted[-3..-1].reverse
  end

  def most_recent_recipe
    recent = recipecards.sort_by{|rc| rc.date}
    recent[-1]
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select {|a| a.user == self}
  end

  def declare_allergen(name, ingredient)
    Allergen.new(name, self, ingredient)
  end

end
