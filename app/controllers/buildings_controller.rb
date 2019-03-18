class BuildingsController < ApplicationController
  def index
    @resources = Building.all

    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = Building.new(permitted_params)

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
    params.require(:building)
          .permit(:name, :account_id, :time_zone, :description, :building_photo_big,
                  :building_photo_small, :visibility, :working_hours, :street, :phone,
                  :label, :building_polygon, :order, :published, :multipolygon)
  end
end
