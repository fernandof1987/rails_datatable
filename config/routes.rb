Rails.application.routes.draw do
  resources :products
  resources :clients
  resources :users
  resources :product_subgroups
  resources :product_groups


  get '/', to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
