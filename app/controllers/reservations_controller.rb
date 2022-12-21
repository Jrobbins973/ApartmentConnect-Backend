class ReservationsController < ApplicationController

    # INDEX
    def index
    reservations = Reservation.all 
    render json: reservations, status: :ok, include: [:tenant]
    end

    # SHOW
    def show
    reservation = Reservation.find(params[:id])
    render json: reservation, status: :ok, include: [:tenant]
    end

    # CREATE
    def create
    reservation = Reservation.create(reservation_params)
    render json: reservation, status: :created, include: [:tenant]
    end

    private 

    def reservation_params 
        params.permit(:tenant_id, :ammenity, :date_reserved, :description, :approved, :title)
    end
end
