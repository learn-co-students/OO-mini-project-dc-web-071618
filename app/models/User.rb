class User 
    attr_accessor :name 
    @@all = [] 
    def self.all 
        @@all 
    end

    def initialize(name:)
        @name = name
        @@all << self
    end

    def recipe_cards 
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self 
        end
    end

    def recipes 
        self.recipe_cards.map do |recipe_card|
            recipe_card.recipe 
        end
    end

    def add_recipe_card(recipe:, date:, rating:)
        RecipeCard.new(user: self, recipe: recipe, date: date, rating: rating)
    end

    def declare_allergen(ingredient:)
        Allergen.new(user: self, ingredient: ingredient)
    end

    def allergens 
        Allergen.all.select do |allergen|
            allergen.user == self 
        end
    end

    def top_three_recipes 
        self.recipe_cards.sort_by do |recipe_card|
            recipe_card.rating 
        end[-3, 3].reverse.map do |recipe_card|
            recipe_card.recipe 
        end
    end

    def most_recent_recipe 
        self.recipe_cards.sort_by do |recipe_card| 
            recipe_card.date 
        end[-1].recipe
    end

end