class BuildingsController < ApplicationController
  def show
    render json: { result: :ok }, status: 200
  end
end
