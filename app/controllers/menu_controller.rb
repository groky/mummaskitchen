class MenuController < ApplicationController
  def index
    @title = "Menu"
    @header = (params[:freezer]=='t' ? "Frozen Items" : "On the menu")
    @freezer = params[:freezer]
    @menu = Menu.find(:all)
  end

end
