class Ingredient

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def number_of_users_allergic
    allergens = Allergen.all.select {|a| a.ingredient == self}
    allergens.count
  end

  def self.allergy_frequency
    x = {}
    all.each do |ing|
      x[ing]=ing.number_of_users_allergic
    end
    x
  end

  def self.most_common_allergen
    allergy_frequency.sort_by {|key, value| value}[-1][0]
  end

end


#-------
# ### `Ingredient`
# Build the following methods on the Ingredient class
# - `Ingredient.all`
# should return all of the ingredient instances
# - `Ingredient.most_common_allergen`
# should return the ingredient instance that the highest number of users are allergic to
#
