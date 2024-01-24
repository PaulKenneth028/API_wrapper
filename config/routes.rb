Rails.application.routes.draw do
  get '/games', to: 'games#index'
end

