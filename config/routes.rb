Rails.application.routes.draw do
  get '/about', to: 'about#index'

  get 'random_powers/index'
  resources :battles
  root 'random_powers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
