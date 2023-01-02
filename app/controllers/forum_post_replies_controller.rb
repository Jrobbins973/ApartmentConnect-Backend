class ForumPostRepliesController < ApplicationController

    # CREATE NEW
    def create
    reply = ForumPostReply.create!(reply_params)
    render json: reply, status: :created
    end

    # DELETE
    def destroy
    reply = ForumPostReply.find(params[:id])
    reply.destroy
    render json: {}, status: :ok
    end

    # UPDATE / PATCH
    def update
    reply = ForumPostReply.find(params[:id])
    reply.update!(reply_params)
    render json: reply, status: :ok
    end

    private

    def reply_params
        params.permit(:forum_post_id, :tenant_id, :text) 
    end
end
