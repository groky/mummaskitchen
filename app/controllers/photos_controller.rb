class PhotosController < ApplicationController
  def add
    @photo = Photos.new
    dish = Dish.find(params[:dish_id]) if params[:dish_id].present? 
    @dishes = dish.nil? ? Dish.all : Dish.find_all_by_menu_id(dish.menu_id)
    
    if params[:photos].present? && params[:photos][:name].present? #upload the file
      #upload params[:photos][:name]
      @photo = Photos.new(params[:photos])
      if upload(@photo.name)
        @photo.name = @photo.name.original_filename
        @photo.save!
      end
    end
    
  end

  def update
  end

  def index
  end

private
  def upload(file)
    directory = "public/images/"
    path=Rails.root.join(directory, file.original_filename)
    File.open(path.to_s, "wb") {|f| f.write file.read }
  end

end
