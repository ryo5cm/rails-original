Rails.application.routes.draw do

  devise_for :users
  root 'pictures#index'

  resources :users, only: [:show, :edit, :update]
  resources :ranking, only: [:index, :show]
  resources :genre, only: :index

  resources :pictures, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

end
