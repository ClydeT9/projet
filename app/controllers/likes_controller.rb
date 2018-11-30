class LikesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @like = current_user.likes.build(like_params)
      if @like.save
        @software = @like.software
        @is_liked = @like
        respond_to :js
      else
        flash[:alert] = "Un problème est survenu ..."
      end
    end
  
    def destroy
      @like = Like.find(params[:id])
      @software = @like.software
      if @like.destroy
        respond_to :js
      else
        flash[:alert] = "Un problème est survenu ..."
      end
    end
  
    private
    def like_params
      params.permit :user_id, :software_id
    end
  end