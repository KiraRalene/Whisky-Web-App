Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: [:new, :create, :edit, :update]

  resources :whiskies

  resources :notes do
    resources :likes, only: [:create, :destroy]
  end
end
