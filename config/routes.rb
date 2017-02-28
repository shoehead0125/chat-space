Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  resources :groups, except: [:show,:index, :destroy] do
    resources :messages, only: [:index]
  end
end
