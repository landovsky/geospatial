class FloorsController < ApplicationController
  def index
    @resources = Floor.all

    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = Floor.new(permitted_params)

    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(permitted_params)
      render json: @resource, status: :ok
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    render status: :ok
  end

  private

  def permitted_params
    params.require(:floor)
          .permit(:building_id, :position, :title, :transformation,
                  :deployment_photo, :wgs_transformation, :published,
                  :floor, :height, :deployment_photo_width, :deployment_photo_height,
                  :multipolygon, floor_polygon: [], ppm: [])
  end
end
