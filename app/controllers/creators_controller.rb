class CreatorsController < ApplicationController
    def index
      @creators = Rawg::Client.creators
  
      if @creators
        render json: @creators
      else
        render json: { error: "Failed to retrieve data from Rawg API" }, status: :unprocessable_entity
      end
    end
  end