Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: "users/registrations"
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'profiles', to: 'users/registrations#edit_profile'
    patch 'profiles', to: 'users/registrations#update_profile'
  end
  
  root 'books#index'
  resources :books, only:[:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
    resource :comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
