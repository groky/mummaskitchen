class Menu < ActiveRecord::Base
  has_many :dishes
  
  def images(id)
    Photos.displayimages(id)
  end
end
