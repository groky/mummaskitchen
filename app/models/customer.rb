class Customer < ActiveRecord::Base
    
    has_many :customerorders
    
    validates_presence_of :name, :phone, :email
    validates_uniqueness_of :email, :phone
    validates_size_of :name, :within => 2..50
    validates_size_of :email, :within => 6..50
    validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
    validates_numericality_of :phone, :allow_nil => false
   
   def has_phone?(submitted_phone)
     phone==submitted_phone
   end
   
   def self.authenticate(email, submitted_phone)
     customer = find_by_email(email)
     return nil  if customer.nil?
     return customer if customer.has_phone?(submitted_phone)
   end
end
