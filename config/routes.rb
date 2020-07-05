Rails.application.routes.draw do

root 'toilet#welcome'
  namespace :api do
    namespace :v1 do
      resources :ratings
      resources :toilets
      resources :users
      post '/login', to: 'auth#login'
      get '/get_user', to: 'auth#get_user'
    end
  end
end
