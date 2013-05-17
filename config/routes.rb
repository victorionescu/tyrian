Lodge::Application.routes.draw do

  devise_for :members

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
    
  root to: 'home#index'
  
  match 'home' => 'home#index', as: :home
  
  match 'about' => 'about#index', as: :about

  match 'officers' => 'officers#index', as: :officers
  
  match 'calendar' => 'calendar#index', as: :calendar
  
  match 'guestbook' => 'guest_book_entries#index', as: :guestbook
  
  match 'guestbook/new' => 'guest_book_entries#new', as: :new_guestbook_entry
  
  # ADMIN / MEMBERS
  
  match 'admin/members' => 'admin/members#index', as: :manage_members
  
  get 'admin/members/:id' => 'admin/members#edit', as: :manage_member
  
  put 'admin/members/:id' => 'admin/members#update'
  
  delete 'admin/member/:id' => 'admin/memebers#destroy'
  
  # ADMIN / GUESTBOOK
  
  match 'admin/guestbook' => 'admin/guestbook#index', as: :manage_guestbook
  
  post 'admin/guestbook/:id' => 'admin/guestbook#accept', as: :manage_guest_book_entry
  
  delete 'admin/guestbook/:id' => 'admin/guestbook#reject'
  
  # ADMIN / CALENDAR
  
  get 'admin/calendar' => 'admin/calendar#index', as: :manage_calendar
  
  post 'admin/calendar' => 'admin/calendar#create'
  
  match 'admin/calendar/new' => 'admin/calendar#new', as: :new_calendar_event
  
  get 'admin/calendar/:id' => 'admin/calendar#edit', as: :manage_calendar_event
  
  delete 'admin/calendar/:id' => 'admin/calendar#destroy'
  
  # ADMIN / SECTIONS
  
  match 'admin/sections' => 'admin/sections#index', as: :manage_sections
  
  get 'admin/sections/:id' => 'admin/sections#edit', as: :manage_section
  
  put 'admin/sections/:id' => 'admin/sections#update'
  
  # ADMIN / CALL TREE
  
  match 'admin/call_tree' => 'admin/call_tree#index', as: :call_tree
  
  
  resources :guest_book_entries

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
