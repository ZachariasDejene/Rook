Rails.application.routes.draw do
  
  resources :users
  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices
  resources :sessions

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy

  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  get 'cart' => 'carts#index', :as => :show_cart
  get 'cart/add/:id' => 'carts#add_to_cart', :as => :add_to_cart
  get 'cart/remove/:id' => 'carts#remove_from_cart', :as => :remove_from_cart
  get 'cart/dump_cart' => 'carts#dump_cart', as: :dump_cart
  get 'cart/checkout' => 'cart#checkout', as: :checkout
  
  # Set the root url
  root :to => 'home#home'  

end
