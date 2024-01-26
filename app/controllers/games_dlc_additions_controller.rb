class GamesDlcAdditionsController < ApplicationController
    def index
      game_pk = params[:game_pk]
      @games_dlc_additions = Rawg::Client.games_dlc_additions(game_pk)
  
      if @games_dlc_additions
        render json: @games_dlc_additions
      else
        render json: { error: "Failed to retrieve data from Rawg API" }, status: :unprocessable_entity
      end
    end
end 