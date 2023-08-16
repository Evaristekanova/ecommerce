Rails.application.routes.draw do

  namespace :api do
    namespace :v1, path: '/' do
      resources :users
    end
  end
end
