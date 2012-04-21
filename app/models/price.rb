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
  
  def self.build(dish_id)
    for i in 0..3
      price=Price.new
      
      price.dish_id=dish_id
      
      price.size = ((i==0 || i==2) ? 2 : 1)
      price.price = ((i==0 || i==2) ? 4 : 6)
      price.freezer = ((i==0 || i==1) ? true : false)
      price.quantity=0
      price.save
  
    end
  end
  
end
