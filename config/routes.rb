Rails.application.routes.draw do
  root 'customers#index'

  resources :customers do
    get 'export'
  end

  resources :games do
    collection do
      put 'update_availability' => 'games#update_availability'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
