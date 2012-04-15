class CustomerOrder < ActiveRecord::Base
  belongs_to :customers
  has_many :dishes
  has_many :prices
  
  def self.customer_orders(customer_id)
    find_all_by_customer_id(customer_id)
  end
end
