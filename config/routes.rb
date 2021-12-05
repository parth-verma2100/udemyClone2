Rails.application.routes.draw do
  resources :enrollments
  resources :order_items
  resources :carts 
  resources :courses do
   resources :videos
  end
  root 'courses#home'
  get 'carts/show'
  get '/courses/my_enroll/:id', to: 'courses#create', as:'enroll_regist'
  get '/courses/enroll/:id', to: 'enrollments#create', as:'enroll_course'
  get 'cart/checkout', to:'carts#checkout', as:'checkout'
  post 'courses/add_to_cart/:id', to:'courses#add_to_cart', as: 'add_to_cart'
  delete 'courses/remove_from_cart/:id', to:'courses#remove_from_cart', as:'remove_from_cart'
  devise_for :users
end
