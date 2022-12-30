class ForumPostRepliesController < ApplicationController

    # CREATE NEW

    def create
    reply = ForumPostReply.create!(reply_params)
    render json: reply, status: :created
    end

    private

    def reply_params
        params.permit(:forum_post_id, :tenant_id, :text) 
    end
end
