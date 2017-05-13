Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'customers#index'
  resources :customers do
    get 'export'
  end
  resources :users 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
