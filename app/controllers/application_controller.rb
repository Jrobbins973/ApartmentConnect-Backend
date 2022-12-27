class ApplicationController < ActionController::API

    include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found



    def current_user 
    auth_token = request.headers['auth_token']
        if auth_token 
            token = JWT.decode( auth_token, ENV["JWT_TOKEN"])[0]
            return Tenant.find_by(id: token['tenant'])
        else
            return nil
        end
    end

    def authorize! 
        unless current_user 
            render json: {errors: ["You must be logged in to view the website"]}, status: :unauthorized
        end
    end


    private

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end 

    def render_not_found(error)
        render json: {error: "404 not found"}, status: :not_found
    end 
end
