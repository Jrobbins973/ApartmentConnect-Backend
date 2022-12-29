class MaintenanceRequestsController < ApplicationController


    # CREATE NEW REQUEST

    def create
    request = MaintenanceRequest.create!(maintenance_request_params)
    render json: request, status: :created
    end

    # GET THEM ALL
    def index
    requests = MaintenanceRequest.all 
    render json: requests, status: :ok
    end

    private

    def maintenance_request_params 
        params.permit(:apartment_id, :description, :urgency, :completed, :completed_by, :tenant_id)
    end


end
