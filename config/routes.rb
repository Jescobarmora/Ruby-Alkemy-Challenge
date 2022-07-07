Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'

  namespace :api do
    namespace :v1 do
        resources :movies, param: :_title
        resources :characters,  param: :_name
        resources :genres, param: :_name
    end
  end
end