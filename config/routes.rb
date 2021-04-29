Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: "users/registrations"
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  
  root 'books#index'
  resources :books, only:[:index, :new, :create, :show] do
    resource :comments, only: :create
  end
  
  resources :users, only: [:show, :edit, :update]
end
