class RecipeCard

  attr_accessor :name, :recipe, :user, :date, :rating
  @@all = []

  def initialize(name, recipe, user, date, rating)
    @name = name
    @recipe = recipe
    @user = user
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
