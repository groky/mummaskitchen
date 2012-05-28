class CustomerController < ApplicationController
  @customer;
  include AdminHelper
  
  def register
    @title = "Register"
    @customer = Customer.new    
    
    if params[:customer].present?
      @customer = Customer.authenticate(params[:customer][:email], params[:customer][:phone])
  
      if @customer.nil?
        @customer = Customer.new(params[:customer])
        @customer.save
        signin(@customer)
        redirect_to :controller=>:session, :action=>:takeaway if has_orders?
      end
    end
   
  end

  def order
    @title = "Order"
  end

  def update
    @title = "Update"
  end
  
  def login
    @title = "Signing in..."
    @customer = Customer.new
    
    if params[:customer].present?
      @customer = Customer.authenticate(params[:customer][:email], params[:customer][:phone])
      if @customer.nil?
        flash[:error]="Please provide a valid email and phone number"
        @customer = Customer.new
      else
        signin(@customer)
        redirect_to :controller=>:session, :action=>:takeaway
      end
    end 
    #manage_orders(@customer) if has_orders?
     
  end
  
  def complete
    @title = "Order completed"
    customer = current_user
    
    defrosts = params[:defrost]
    comment = params[:comment]
    
    manage_orders(customer, defrosts, comment)
        
    flash[:notice] = "We have created your order!... "
  end
  
  def finished
    @title = "Order completed"
    @customer = current_user

    flash[:notice] = "We have created your order!... "
  end
  
  private
  
  def manage_orders(customer, defrosts, comment)
    
    #check availability
    corder = Array.new #items fulfilled
    uncorder = Array.new #items not fulfilled due to stock limits
    
    #create the order
    order = create_order(customer.id, comment)
    
    # add the items
    items.each do |o|
      price = Price.find(o[:id])
      if Price.available?(o[:id], o[:quantity])
        order_item = CustomerOrder.new
        order_item.order_id = order.id
        order_item.dish_id = o[:dish]
        order_item.price_id = o[:id]
        order_item.quantity = o[:quantity]
        
        defrosts.select do |key, hash|
          #puts "THE KEY IS #{key}\n"
          if key.to_i == price.id
            order_item.thaw = (hash=='on' ? true : false)
          end
        end
        
        order_item.save
        
        #draw down the stock
        price.quantity = price.quantity - o[:quantity]
        price.save
        
        # make sure you send the correct quantity to the order confirmation
        price.quantity = o[:quantity]
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
    
    if CustomerMailer.order_confirmation(customer, corder, uncorder, defrosts, comment).deliver
      redirect_to :controller=>:customer, :action=>:finished
    else
      render :text=>"Your email could not be sent. There must have been a problem"
    end
  end
  
  def create_order(customer_id, comment)
    order = Order.new
    order.customer_id = customer_id
    order.comment = comment
    order.save
    
    return order
  end
  
  def has_orders?
    item_count>0
  end
end
