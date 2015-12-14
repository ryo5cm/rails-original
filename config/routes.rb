Rails.application.routes.draw do

  devise_for :users
  root 'pictures#index'

  resources :pictures, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

end
