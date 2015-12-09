Rails.application.routes.draw do

  root 'pictures#index'

  resources :pictures, only: :index do
    resources :reivews, only: [:new, :create]
  end

end
