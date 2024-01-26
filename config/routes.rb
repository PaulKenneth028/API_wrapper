Rails.application.routes.draw do
  get '/creator-roles', to: 'creator_roles#index'
  get '/games', to: 'games#index'
  get '/creators', to: 'creators#index'
  get '/genres', to: 'genres#index'
  get '/games/:game_pk/additions', to: 'games_dlc_additions#index'
end

