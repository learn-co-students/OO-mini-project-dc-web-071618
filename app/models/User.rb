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
