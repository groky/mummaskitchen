class DishController < ApplicationController
  
  def index
    @dishes = Dish.all
  end
  
  def dishes
    @dishes = Dish.freezer(params[:menu_id],params[:freezer], params[:page])
    @where = params[:freezer]
    headpart = @where=='t' ? "Freezer" : "Fresh"
    @header = "#{Menu.find(params[:menu_id]).name} - #{headpart(@where)}"
    @title = @header
  end
  
  def dish
    @dish = Dish.find(params[:id])
    @header = @title = "#{@dish.name} - #{headpart(@where)}"
  end
  
  def search
    @dishes = params[:search].present? ? Dish.search(params[:search], params[:page]) : nil
    @search = params[:search] if params[:search].present?
  end
  
  private
    def headpart(val)
      if val==true || val=='t'
        part="Freezer"
      else
        part="Fresh"
      end
    end
end
