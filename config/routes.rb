Rails.application.routes.draw do

  post 'update_items', to: 'carts#update_items'
  resources :items, only: [:index, :show]
  resources :carts, only: [:index, :show]

end
