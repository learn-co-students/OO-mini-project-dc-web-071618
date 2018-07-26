class Ingredient

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select {|a| a.ingredient == self}
  end

  def self.most_common_allergen
    instant = @@all[0]
    num = 0
    @@all.each do |i|
      if i.allergens.count > num
        instant = i
        num = i.allergens.count
      end
    end
    instant
  end

end
