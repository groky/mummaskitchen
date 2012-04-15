class Price < ActiveRecord::Base
  belongs_to :menu
  belongs_to :customerorder
  belongs_to :dish
  
  def self.total(id)
    find(id).quantity
  end
  
  def self.available?(id, amount)
    find(id).quantity>=amount
  end
  
  def name(dish_id)
    Dish.find(dish_id).name
  end
  
  def self.sizew(id)
    find(id).size==1 ? "LARGE" : "MEDIUM"
  end
  
end
