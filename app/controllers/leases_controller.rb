class LeasesController < ApplicationController

    # INDEX 
    def index
    leases = Lease.all
    render json: leases, status: :ok, include: :tenant
    end

    # SHOW
    def show 
    lease = Lease.find(params[:id])
    render json: lease, status: :ok, include: :tenant
    end

    # CREATE 
    def create
    lease = Lease.create(lease_params)
    render json: lease, status: :created
    end

    private 

    def lease_params 
    params.permit(:apartment_id, :tenant_id, :move_in_date, :move_out_date, :pets, 
    :pet_count, :lease_start, :lease_end, :rent, :rent_duedate)
    end
end
