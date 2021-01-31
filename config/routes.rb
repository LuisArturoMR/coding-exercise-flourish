Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'

  resources :rewards, only: [:index]
  resources :user_events, only: [:create]
  resources :user, only: [:index, :redeem]
  post '/users/:id/redeems', to: 'users#redeems'
end
