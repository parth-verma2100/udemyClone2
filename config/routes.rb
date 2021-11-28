Rails.application.routes.draw do
  get 'carts/show'
  devise_for :users
  devise_for :instructors
  resources :enrollments
  resources :carts 
  resources :courses do
   resources :videos
  end
  
  root 'courses#home'
  get '/courses/my_enroll/:id', to: 'courses#create', as:'enroll_regist'
  get '/courses/enroll/:id', to: 'enrollments#create', as:'enroll_course'
  post 'courses/add_to_cart/:id', to:'courses#add_to_cart', as: 'add_to_cart'
  delete 'courses/remove_from_cart/:id', to:'courses#remove_from_cart', as:'remove_from_cart'
  
# root 'products#index'

  # get 'carts/:id' => "carts#show", as: "cart"
  # delete 'carts/:id' => "carts#destroy"

# post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
# post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
# post 'line_items' => "line_items#create"
# get 'line_items/:id' => "line_items#show", as: "line_item"
# delete 'line_items/:id' => "line_items#destroy"

# resources :products
# resources :orders
end
