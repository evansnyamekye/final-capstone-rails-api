class Api::V1::ReservationsController < ApplicationController
  # GET /api/v1/users/:user_id/reservations
  def index
    user = User.find(params[:user_id])
    reservations = user.reservations.includes(:place) # Include place information
    render json: reservations, include: [:place], status: :ok # Serialize place information
  end

  # GET /api/v1/users/:user_id/reservations/:id
  def show
    reservation = Reservation.find(params[:id])
    render json: reservation, status: :ok
  end

  def new
    user = User.find(params[:user_id])
    reservation = user.reservations.build
    render json: reservation, status: :ok
  end

  # POST /api/v1/users/:user_id/reservations
  def create
    user = User.find(params[:user_id])
    reservation = user.reservations.build(reservation_params)

    if reservation.save
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/:user_id/reservations/:id
  def update
    reservation = Reservation.find(params[:id])

    if reservation.update(reservation_params)
      render json: reservation, status: :ok
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:user_id/reservations/:id
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    head :no_content
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :place_id, :user_id)
  end
end
