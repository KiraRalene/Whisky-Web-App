Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :home
  resources :searches
  resources :users, only: [:new, :create, :edit, :update, :show]

  resources :whiskies do
    resources :notes, only: [:new, :create] do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :notes, only: [:show]

  resources :sessions, only: [:new, :create,] do
    delete :destroy, on: :collection
  end

end
