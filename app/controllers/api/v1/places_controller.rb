class Api::V1::PlacesController < ApplicationController
  before_action :set_place, only: %i[show update destroy]

  # GET /places
  def index
    @places = Place.all
    render json: @places
  end

  # GET /places/1
  def show
    render json: @place
  end

  def new
    @place = Place.new
    render json: @place
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      render json: @place, status: :created
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  def destroy
    @place = current_user.places.find(params[:id])
    if @place.destroy
      render json: {
        status:{
          code: 200,
          message: "Place has been deleted successfully."
        }
      }, status: :ok 
    else
      render json: {
        status:{
          code: 500,
          message: "The place could not be deleted."
        }
      }, status: :internal_server_error
    end 
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    params.require(:place).permit(:description, :photo, :location, :rate, :user_id, :address)
  end
end
