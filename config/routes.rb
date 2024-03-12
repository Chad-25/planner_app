Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :users do
    resources :categories
  end

  resources :categories do
    resources :tasks
  end

  resources :tasks do
    member do
      patch 'update_status'
    end
  end
end
