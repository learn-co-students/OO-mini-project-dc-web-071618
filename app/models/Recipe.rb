class Recipe 
    @@all = [] 
    attr_accessor :name 
    def self.all 
        @@all 
    end

    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.most_popular 
        self.all.sort_by do |recipe|
            recipe.recipe_cards.length
        end[-1]
    end

    def recipe_cards 
        RecipeCard.all.select do |recipe_card|
            recipe_card.recipe == self
        end
    end

    def users 
        recipe_cards.map do |recipe_card|
            recipe_card.user 
        end
    end

    def recipe_ingredients
        RecipeIngredient.all.select do |recipe_ingredient|
            recipe_ingredient.recipe == self
        end
    end

    def ingredients 
        recipe_ingredients.select do |recipe_ingredient|
            recipe_ingredient.recipe == self
        end
    end

    def allergens 
        self.users.map do |user|
            user.allergens
        end
    end
# not working yet!
    def add_ingredients(ingredients)
        # ingredients.each do |ingredient|
        #     self.ingredients << ingredient 
        # end
        RecipeIngredient.new(recipe: self,ingredient:ingredients)
    end
end