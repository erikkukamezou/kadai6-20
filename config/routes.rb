Rails.application.routes.draw do
  get 'pictures/index'
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
