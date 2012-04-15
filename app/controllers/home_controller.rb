class HomeController < ApplicationController
  def index
    @title = "Home"
  end

  def about
    @title = "About Us"
  end

  def contact
    @title = "Contact"
  end
  
  def menu
    @title = "Menu"
  end
  
  def freezer
    @title = @header = "Freezer"
    @dishes = Dish.freezerall 
  end
end
