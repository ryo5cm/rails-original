Rails.application.routes.draw do

  devise_for :users
  root 'pictures#index'

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :like_pictures
    end
  end

  resources :ranking, only: [:index, :show]
  resources :genre, only: :index

  post "like/:picture_id" => "likes#like", as: "like"
  delete "unlike/:picture_id" => "likes#unlike", as: "unlike"

  resources :pictures, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :reviews, only: [:new, :create]
    member do
      get :liking_users
    end
  end

end
