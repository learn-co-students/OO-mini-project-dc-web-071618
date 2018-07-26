class Allergen 
    @@all = [] 
    attr_accessor :user, :ingredient 
    def self.all 
        @@all 
    end
    def initialize(user:, ingredient:)
        @user = user 
        @ingredient = ingredient
        @@all << self
    end

end