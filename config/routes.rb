Rails.application.routes.draw do
  root to: 'rates#index'
  get '/admin', to: 'rates#new'
end
