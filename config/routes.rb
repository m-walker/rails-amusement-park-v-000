Rails.application.routes.draw do

  resources :attractions, only: [:index, :show]

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :sessions, only: [:create, :destroy]
  
  get 'signin', to: 'sessions#new'

  root to: 'welcome#home'
end