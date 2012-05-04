module SessionHelper
  
  def initialise
    
    #cookies.permanent.signed[:remember_token] = nil
    session[:basket]=Array.new
  end
  
  def add_item(price)
    initialise if !initialised?
    
    dish = Dish.find(price.dish_id)
    
    @basket=item_in_basket(price)
    
    if @basket[:found]
      update_quantity(1, @basket[:loc])
    else
      item = {
          :name=>dish.name,
          :id=>price.id, 
          :dish=>price.dish_id, 
          :menu=>dish.menu_id, 
          :price=>price.price,
          :size=>price.size, 
          :freezer=>price.freezer,
          :quantity=>1,
          :defrost=>false 
      }
    
      session[:basket] << item
    end
    
  end
  
  def initialised?
    !session[:basket].nil?
  end    
  
  def from_freezer
    items_from(true)
  end
  
  def freshly_cooked
    items_from(false)
  end
  
  def items
    session[:basket] unless session[:basket].nil?
  end
  
  def item_count
    count = 0
    if !session[:basket].nil?
      items.each do |item|
        count+=item[:quantity]
      end
    end
    count
  end
  
  def item_available?(price)
    Price.total(price.id)>=(item_count+1)
  end
  
  def uninitialise
    session[:basket]=nil
  end
  
  def drop(price)
    @to_delete = item_in_basket(price)
    if @to_delete[:found]
      delete_item(@to_delete[:loc])
    end
  end
  
  def currency(val)
    '%.2f' % val
  end
  
  def item_in_basket(price)
    found = false
    location = 0
    if !items.nil?
      items.each_with_index do |i, loc|
        if !found
          if i[:id]==price.id
            location = loc
            found = true
          end
        end
      end
    end
    val = Array.new
    val = {:found=>found, :loc=>location}
  end
  
  
  #private stuff
  private 
    
    def find_item(location)
      if location[:found]==true
        items[location]
      end
    end
    
    def update_quantity(quantity, location)  
        session[:basket][location][:quantity]+=quantity
    end
    
    def delete_item(location)
      session[:basket].delete_at(location)
    end

    def items_from(where)
      ordered_items = Array.new
      
      session[:basket].each do |item|
          ordered_items << item unless item[:freezer]!=where      
      end
      
      ordered_items      
    end
end
