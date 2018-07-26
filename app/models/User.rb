class User

    @@all = []

    attr_accessor :user_name

    def initialize (user_name)
      @user_name = user_name
      @@all << self
    end

    def self.all
      @@all
    end

    def recipe_cards
      RecipeCard.all.select {|a| a.user == self}
    end

    def recipes
      recipe_cards.map {|rc| rc.recipe}
    end

    def add_recipe_card(recipe, date, rating)
      RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergen (ingredient)
      Allergen.new(self, ingredient)
    end

    def allergens
      user_allergens = Allergen.all.select {|a| a.user == self}
      user_allergens.map {|ua| ua.ingredient}
    end

    def top_three_recipes
      recipe_cards.sort_by{|rc| rc.rating}[-3..-1]
    end

    def most_recent_recipe
      self.recipes[-1]
    end


end


#----------
# - `User.all`
# should return all of the user instances
# - `User#recipes`
# should return all of the recipes this user has recipe cards for
# - `User#add_recipe_card`
# should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
# - `User#declare_allergen`
# should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
# - `User#allergens`
# should return all of the ingredients this user is allergic to
# - `User#top_three_recipes`
# should return the top three highest rated recipes for this user.
# - `User#most_recent_recipe`
# should return the recipe most recently added to the user's cookbook.
