class ForumPostsController < ApplicationController

    # INDEX
    def index
    posts = ForumPost.all 
    render json: posts, status: :ok
    end

    # SHOW
    def show
    post = ForumPost.find(params[:id])
    render json: post, status: :ok
    end


    private 

    def forum_post_params 
        params.permit(:tenant_id, :text, :category)
    end
end
