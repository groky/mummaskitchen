class Photos < ActiveRecord::Base
  belongs_to :dish
  
  def self.displayimages(menu_id)
    Photos.find(:all, 
                :select=>"DISTINCT \"photos\".* ", 
                :joins=>:dish, 
                :conditions=>"menu_id=#{menu_id}", 
                :order=>"photos.created_at DESC LIMIT 3")
  end
end
