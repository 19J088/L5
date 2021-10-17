Rails.application.routes.draw do
  resources :users
  root 'tops#main'

  get '/tweets/new_tweet'  
  post '/tweets/new_tweet', to: 'tweets#create'
  resources :tweets


  post '/tops/login'
  get '/tops/logout'
  
  resources :likes
end
