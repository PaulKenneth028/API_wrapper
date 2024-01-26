class CreatorRolesController < ApplicationController
  def index
    @creator_roles = Rawg::Client.creator_roles

    if @creator_roles
      render json: @creator_roles
    else
      render json: { error: "Failed to retrieve data from Rawg API" }, status: :unprocessable_entity
    end
  end
end
