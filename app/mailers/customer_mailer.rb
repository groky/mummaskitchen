class CustomerMailer < ActionMailer::Base
  include SessionHelper
  helper :session
  default :from => "mumma@mummaskitchen.net"
  
  def order_confirmation(customer, order, not_ordered)
    @customer = customer
    @order = order
    @unorder = not_ordered
    
    mail(:to=>@customer.email, :subject=>"Order confirmation", :bcc=>:from, :content_type=>"text/plain")
    
  end
  
  #def vendor_notify(customer)
  #  @customer = customer   
  #  mail(:to=>:from, :subject=>"Order confirmation")
  #end
end
