class TenantsController < ApplicationController

    # INDEX
    def index
    tenants = Tenant.all 
    render json: tenants, status: :ok, except: :password_digest, include: :forum_posts
    end

    # SHOW
    def show
    tenant = Tenant.find(params[:id])
    render json: tenant, status: :ok, except: :password_digest, include: [:forum_posts, :leases]
    end

    # CREATE
    def create
    tenant = Tenant.create(tenant_params)
    render json: tenant, status: :created, except: :password_digest
    end

private

    def tenant_params 
    params.permit(:first_name, :last_name, :phone_number, :email_address, :password)
    end

    
end
