class FloorsController < ApplicationController
  before_action :set_floor, only: [:show, :update, :destroy]

  # GET /floors
  def index
    @floors = Floor.all

    render json: @floors
  end

  # GET /floors/1
  def show
    render json: @floor
  end

  # POST /floors
  def create
    @floor = Floor.new(floor_params)

    if @floor.save
      render json: @floor, status: :created, location: @floor
    else
      render json: @floor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /floors/1
  def update
    if @floor.update(floor_params)
      render json: @floor
    else
      render json: @floor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /floors/1
  def destroy
    @floor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floor
      @floor = Floor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def floor_params
      params.fetch(:floor, {})
    end
end
