Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      jsonapi_resources :posts
      post 'login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'
    end
  end
end
