
class GamesController < ApplicationController
  def index
    @games = Rawg::Client.games

    if @games
      render json: @games
    else
      render json: { error: "Failed to retrieve data from Rawg API" }, status: :unprocessable_entity
    end
  end
end
