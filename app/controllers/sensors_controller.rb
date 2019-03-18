class SensorsController < ApplicationController
  def index
    @resources = Sensor.all

    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = Sensor.new(permitted_params)

    if @resource.save
      render json: @resource, status: :created, location: sensor_path(@resource)
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(permitted_params)
      render json: @resource
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
    params.require(:sensor)
          .permit(:floor_id, :building_id, :coordinates, :device_type, :major, :minor, :tx_power,
                  :cc1310_id, :sn, :rssi, :beacon_type, :type, :stone_name, :position, :height)
  end
end
