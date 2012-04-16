class DishController < ApplicationController
  
  def index
    @dishes = Dish.all
  end
  
  def dishes
    @dishes = Dish.freezer(params[:menu_id],params[:freezer])
    @where = params[:freezer]
    @header = Menu.find(params[:menu_id]).name
  end
  
  def dish
    @dish = Dish.find(params[:id])
  end
  
end
