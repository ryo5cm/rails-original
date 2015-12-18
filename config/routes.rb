Rails.application.routes.draw do

  devise_for :users
  root 'pictures#index'

  get '/gender/men' => 'pictures#men'
  get '/gender/women' => 'pictures#women'

  resources :users, only: [:show, :edit, :update]
  resources :ranking, only: :index

  resources :pictures, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

end
