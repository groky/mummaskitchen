class DishController < ApplicationController
  
  def index
    @dishes = Dish.all
  end
  
  def dishes
    @dishes = Dish.freezer(params[:menu_id],params[:freezer], params[:page])
    @where = params[:freezer]
    @header = Menu.find(params[:menu_id]).name
  end
  
  def dish
    @dish = Dish.find(params[:id])
  end
  
  def search
    @dishes = params[:like].present? ? Dish.search(params[:like], params[:page]) : nil
  end
  
end
