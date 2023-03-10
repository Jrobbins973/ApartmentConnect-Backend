class SessionsController < ApplicationController

    # LOGIN
    def create
        # @tenant = Tenant.find_by( email_address: params[:email_address])
        # if @tenant and @tenant.authenticate(params[:password])
        #     logged_user = JWT.encode({tenant: @tenant.id}, ENV["JWT_TOKEN"])
        #     render json: {uid: logged_user}, status: :ok
        # else 
        #     render json: {errors: ["Invalid email and/or password"]}, status: :unauthorized
        # end
        tenant = Tenant.find_by(email_address: params[:email_address])
        if tenant and tenant.authenticate(params[:password])
            session[:tenant_id] = tenant.id 
            render json: tenant, status: :ok, except: (:password_digest), include: :leases
        else
            render json: {errors: "Invalid Email or Password"}, status: 401
        end
    end

    # LOGOUT
    def delete 
        session.delete :tenant_id
        head :no_content
    end


end
