class GenresController < ApplicationController
    def index
      @genres = Rawg::Client.genres
  
      if @genres
        render json: @genres
      else
        render json: { error: "Failed to retrieve data from Rawg API" }, status: :unprocessable_entity
      end
    end
  end
  