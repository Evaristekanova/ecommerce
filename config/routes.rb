Rails.application.routes.draw do

  namespace :api do
    namespace :v1, path: '/' do
      resources :users
      resources :products
    end
  end

  namespace :api, path: '/' do
    namespace :v1, path: '/' do
      namespace :auth, path: '/' do
        post 'login', to: 'sessions#login'
      end
    end
  end

end
