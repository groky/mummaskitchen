class Photos < ActiveRecord::Base
  
  def self.displayimages(menu_id)
    Photos.find(:all, 
                :select=>"DISTINCT \"photos\".* ", 
                :joins=>:dish, 
                :conditions=>"menu_id=#{menu_id}", 
                :order=>"RANDOM() LIMIT 3")
  end
end
