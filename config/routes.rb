Mummaskitchen::Application.routes.draw do

  #the cms
  match "admin/edit_home", :to=>"admin#edit_home" 
  
  match "admin", :to=>"admin#login"
  match "admin/menu", :to=>"admin#menu"
  match "admin/ami", :to=>"admin#add_menu_item"
  match "admin/umi/:id", :to=>"admin#update_menu_item"
  match "admin/dmi/:id", :to=>"admin#delete_menu_item"
  
  match "admin/dishes/:menu_id", :to=>"admin#dishes"
  match "admin/dishes", :to=>"admin#dishes"
  match "admin/ad/:menu_id", :to=>"admin#add_dish"
  match "admin/ad", :to=>"admin#add_dish"
  match "admin/ud/:id", :to=>"admin#update_dish"
  match "admin/dd/:id", :to=>"admin#delete_dish"
  
  match "admin/di/:dish_id", :to=>"admin#dish_items"
  match "admin/id", :to=>"admin#dish_items"
  match "admin/adi/:dish_id", :to=>"admin#add_dish_items"
  match "admin/udi/:id/:dish_id", :to=>"admin#update_dish_items"
  
  match "admin/upload", :to=>"admin#upload"
  match "admin/tablet", :to=>"admin#tablet"
  match "admin/signout", :to=>"admin#signout"


  root :to => "home#index"

  #the photos
  match "photos/add/:dish_id", :to=>"photos#add"
  match "photos/add", :to=>"photos#add"
  resources :photos

  #the dish stuff
  match 'dish/dish/:id', :to => 'dish#dish'
  match 'dish/dishes/:menu_id/:freezer', :to => 'dish#dishes'
  match 'dish/index', :to => 'dish#index'
  match 'search/:search', :to =>"dish#search"
  match 'search', :to =>"dish#search"
  resources :dish

  #the menu stuff
  #match 'menu', :to=>'menu#index'
  match '/menu/:freezer', :controller=>:menu, :action=>:index
  resources :menu
  
  #the session stuff
  match "session/new", :to => "session#new"
  match "session/add/:menu_id/:dish_id/:id", :to => "session#add"
  match "takeaway", :to => "session#takeaway"
  match "session/delete/:id", :to => "session#delete"
  match "session/update/:menu_id/:dish_id/:id", :to => "session#update_items"
  get "session/create"
  get "session/destroy"
  resources :session

  #the customer stuff  
  match "register", :to => "customer#register"
  match "signin", :to => "customer#login"
  match "process", :to => "customer#complete"
  match "customer/finished", :to => "customer#finished"
  
  get "customer/order"
  get "customer/update"
  
  resources :customer
  resources :customerorder
  
  # the home stuff
  match '/', :to => "home#index"
  match 'about', :to => "home#about"
  match 'contact', :to => "home#contact"
  #match 'menu', :to => "home#menu" - moved this to menu controller 
  match 'freezer', :to => "home#freezer"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
