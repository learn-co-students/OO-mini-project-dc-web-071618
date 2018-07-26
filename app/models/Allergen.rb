class Allergen

  attr_accessor :name, :user, :ingredient
  @@all = []

  def initialize(name, user, ingredient)
    @name = name
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

end
