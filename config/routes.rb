Rails.application.routes.draw do
  resources :games
  root 'customers#index'
  resources :customers do
    get 'export'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
