Rails.application.routes.draw do

  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:create, :destroy]
  resources :rides, only: [:create]
  
  get 'signin', to: 'sessions#new'

  root to: 'welcome#home'
end