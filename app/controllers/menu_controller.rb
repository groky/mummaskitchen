class MenuController < ApplicationController
  def index
    @title = "Menu"
    @menu = Menu.find(:all)
  end

end
