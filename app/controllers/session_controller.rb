class SessionController < ApplicationController
  
  include AdminHelper
  
  before_filter :start_session
  def new
    @title = "Login"
  end

  def add
    @price = Price.find(params[:id])
    if item_available?(@price)
      add_item(@price)
    else
      flash[:notice] = "Stock is not available for your requested item"
    end
     redirect_to :controller=>'dish', :action=>'dishes', 'menu_id'=>params[:menu_id], 'freezer'=>(@price.freezer ? 't' : 'f')
  end
  
  def create
  end

  def delete
    drop Price.find(params[:id])
    
    if item_count<1
      redirect_to :controller=>'home', :action=>'index'
    else  
      redirect_to :takeaway
    end
    
  end

  def update_items
    add_item(Price.find(params[:id]))
    redirect_to :takeaway
  end

  def destroy
  end
  
  def basket
    @basket ||= Array.new
  end

  def takeaway
    if signed_in?
      @title = @header = "Take Away - Preview"
      @customer ||= current_user
    else
      redirect_to signin_path
    end
  end

private
  def start_session
    initialise unless initialised?
  end
end
