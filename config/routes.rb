Rails.application.routes.draw do

  root 'memes#index'
  resources :memes

  resources :users
  resources :sessions

end
