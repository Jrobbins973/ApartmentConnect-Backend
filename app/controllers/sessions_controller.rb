class SessionsController < ApplicationController

    # LOGIN
    def create
        tenant = Tenant.find_by(first_name: params[:first_name])
        if tenant and tenant.authenticate(params[:password])
            session[:tenant_id] = tenant.id 
            render json: tenant, status: :ok, except: (:password_digest)
        else
            render json: {errors: "Invalid Name or Password"}, status: 401
        end
    end

    # LOGOUT
    def delete 
        session.delete :tenant_id
        head :no_content
    end


end
