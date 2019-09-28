Rails.application.routes.draw do
  root to: 'rates#index'
  get '/admin', to: 'rates#new'
  post '/admin', to: 'rates#create'

  mount ActionCable.server => '/cable'
end
