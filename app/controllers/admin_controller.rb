class AdminController < ApplicationController
  
  include AdminHelper
  
  def login
    
    #render :tablet if signed_in?
    
    @customer = Customer.new
    
    if params['/admin'].present?
      @customer = Customer.authenticate(params['/admin'][:email], params['/admin'][:phone])
    
      if !@customer.nil? && is_admin?(@customer)
        signin(@customer)  
        render :tablet
      else
        flash[:notice] = "You must be logged in to view this page"
      end
    end
    
  end

  def tablet    
  end
  
  def menu
    @menus=Menu.all   
  end

  def add_menu_item
    @menu = Menu.new if !params.present?
    
    if params[:menu].present? && params[:menu][:name].present?
      @menu=Menu.new(params[:menu])
      @menu.save!
      redirect_to :controller=>:admin, :action=>:menu
    end
      
  end

  def update_menu_item
    @menu = Menu.find(params[:id]) if params[:id].present?
    if params[:menu].present? && params[:menu][:name].present?
      @menu.name = params[:menu][:name]
      @menu.description=params[:menu][:description]
      @menu.save!
      redirect_to :controller=>:admin, :action=>:menu
    end
    
  end
  
  def delete_menu_item
    if Menu.delete(params[:id])
      redirect_to :controller=>:admin, :action=>:menu
    end
  end
  
  def dishes
    @dishes = Dish.alldishes(params[:menu_id], params[:page])
  end

  def add_dish
    @dish = Dish.new
    @menus = Menu.all
    if params[:dish].present? && params[:dish][:name].present?
      @dish = Dish.new(params[:dish])
      
      Price.build(@dish.id) if @dish.save
            
      redirect_to :controller=>:admin, :action=>:dishes
    end
  end
  
  def update_dish
    @dish = Dish.find(params[:id]) if params.present?
    @menus = Menu.all
    if params[:dish].present? && params[:dish][:name].present?
      @dish.name = params[:dish][:name]
      @dish.description = params[:dish][:description]
      @dish.menu_id = params[:dish][:menu_id]
      @dish.save!
      redirect_to :controller=>:admin, :action=>:dishes
    end
  end
  
  def delete_dish
    menu_id = Dish.find(params[:id]).menu_id
    if dish.delete(params[:id])
      redirect_to :controller=>:admin, :action=>:menu, 'menu_id'=>menu_id
    end
  end
  
  def dish_items
    @prices = (params[:dish_id].present? ? Price.find_all_by_dish_id(params[:dish_id]) : Price.all)
    @dish = Dish.find(params[:dish_id])
  end
  
  def add_dish_items
    @price = Price.new if params[:dish_id].present?
    @dish = Dish.find(params[:dish_id])
    if params[:price].present?
      if params[:price][:price].present? && params[:price][:quantity].present?
        @price = Price.new(params[:price])
        @price.dish_id = params[:dish_id]
        @price.save!
        redirect_to :controller=>:admin, :action=>:dish_items, 'dish_id'=>params[:dish_id]
      end
    end
  end
  
  def update_dish_items
    @price = Price.find(params[:id]) if params[:id].present?
    @dish = Dish.find(params[:dish_id])
    if params[:price].present?
      if params[:price][:price].present? && params[:price][:quantity].present?
        @price.price = params[:price][:price]
        @price.quantity=params[:price][:quantity]
        @price.freezer=params[:price][:freezer]
        @price.size=params[:price][:size]
        @price.save!
        redirect_to :controller=>:admin, :action=>:dish_items, 'dish_id'=>params[:dish_id]
      end
    end
  end
  
  def upload
  end
  
  def signout
    #create a signout action at admin_helper
    logout
    redirect_to :controller=>:home, :action=>:index
  end

end
