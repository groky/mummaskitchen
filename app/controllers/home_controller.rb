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
    @where = 't' # true for being in the freezer
    @dishes = Dish.freezerall(params[:page])
  end
end
