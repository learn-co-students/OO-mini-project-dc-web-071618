class Ingredient 
    @@all = [] 
    def self.all 
        @@all 
    end

    def initialize(name:)
        @name = name 
        @@all << self
    end

    def self.most_common_allergen 
       Allergen.all.max_by {|a| Allergen.all.count(a.ingredient)}
    end

end