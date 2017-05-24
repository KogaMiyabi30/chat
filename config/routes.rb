Rails.application.routes.draw do
  resources :welcome
  resources :home, only: [:index]
  root 'welcome#index'

  devise_for :users

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end