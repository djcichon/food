class GroceryTrip < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :recipes, through: :dishes

  accepts_nested_attributes_for :dishes

  after_initialize :init

  def init()
    self.label = Date.today.to_s 
  end

  def populate_dishes(recipes)
    recipes.each do |recipe|
      self.dishes.new(grocery_trip: self, recipe: recipe, count: 0)
    end
  end
end
