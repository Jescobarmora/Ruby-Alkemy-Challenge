Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'

  namespace :api do
    namespace :v1 do
        resources :movies
        resources :characters,  param: :_name
        resources :genres
    end
  end
end