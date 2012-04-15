class CustomerController < ApplicationController
  @customer;
  def register
    @title = "Register"
    
    @customer = Customer.authenticate(params[:customer][:email], params[:customer][:phone])
    
    if @customer.nil?
      @customer = Customer.new(params[:customer])
      @customer.save
    end 
 
    manage_orders(@customer) if has_orders?
  end

  def order
    @title = "Order"
  end

  def update
    @title = "Update"
  end
  
  def signin
    @title = "Signing in..."
    @customer = Customer.authenticate(params[:customer][:email], params[:customer][:phone])
    
    manage_orders(@customer) if has_orders?
     
  end
  
  
  def complete
    @title = "Order completed"
    @customer = Customer.find(params[:id])
    
    flash[:notice] = "We have created your order!... you were not yet registered..."
  end
  
  private
  
  def manage_orders(customer)
    
    #check availability
    corder = Array.new #items fulfilled
    uncorder = Array.new #items not fulfilled due to stock limits
    
    items.each do |o|
      price = Price.find(o[:id])
      if Price.available?(o[:id], o[:quantity])
        order_item = CustomerOrder.new
        order_item.customer_id = customer.id
        order_item.dish_id = o[:dish]
        order_item.price_id = o[:id]
        order_item.quantity = o[:quantity]
        order_item.save
        
        #draw down the stock
        price.quantity = price.quantity - o[:quantity]
        price.save
        
        #add it to a list of ordered items
        corder << price
      else
        uncorder << price
      end
    end
    
    #remove it from the session
    #do clean up
    corder.each { |i| drop(i)}
    uncorder.each { |i| drop(i)}   
  
    #then email the client
    CustomerMailer.order_confirmation(customer, corder, uncorder).deliver

    redirect_to :controller=>:customer, 'id'=>@customer.id, :action=>:complete
  end
  
  def has_orders?
    item_count>0
  end
end
