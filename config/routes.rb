Rails.application.routes.draw do

  get 'users/new'
  get 'users/create'
  resources :users

  root 'memes#index'
  resources :memes

end
