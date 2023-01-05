class ForumPostsController < ApplicationController

    # INDEX
    def index
    posts = ForumPost.all.order(id: :desc)
    render json: posts, status: :ok, include: :forum_post_replies, methods: :full_tenant_name
    end

    # SHOW
    def show
    post = ForumPost.find(params[:id])
    render json: post, status: :ok, include: :forum_post_replies
    end

    # CREATE
    def create
    post = ForumPost.create(forum_post_params)
    render json: post, status: :created, methods: :full_tenant_name
    end

    # UPDATE / PATCH
    def update
    post = ForumPost.find(params[:id])
    post.update(forum_post_params)
    render json: post, status: :ok
    end

    
    # DELETE
    def destroy
    post = ForumPost.find(params[:id])
    post.destroy
    render json: {}, status: :ok
    head :no_content 
    end

    # # Sort By category ==> '/category'
    # def categories
    #     byebug
    # post_category = ForumPost.where(category: params[:category])
    # render json: category, status: :ok
    # end


    private 

    def forum_post_params 
        params.permit(:tenant_id, :text, :category)
    end
end
