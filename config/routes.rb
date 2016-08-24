Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :sessions, only: [:new, :create]
  
  get 'sessions/new', to: 'sessions#new', as: 'signin'

  root to: 'welcome#home'
end