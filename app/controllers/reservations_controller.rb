class ReservationsController < ApplicationController

    # INDEX
    def index
    reservations = Reservation.all.order(id: :desc)
    # reservations.order(id: :desc) 
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

    # GETS A FEW RECENT RESERVATIONS '/recentreservations'
    def recent 
    reservation = Reservation.order(id: :desc).limit(2)
    render json: reservation, status: :ok, include: [:tenant]
    end

    # DELETE RESERVATIONS
    def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    render json: {}
    head :no_content
    end

    private 

    def reservation_params 
        params.permit(:tenant_id, :ammenity, :date_reserved, :description, :approved, :title)
    end
end
