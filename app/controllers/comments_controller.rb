class CommentsController < ApplicationController
    def new
        curent_user = current_user || current_editor
        @parent = Comment.find params[:parent_id]
        software = @parent.commentable
        @comment = Comment.build_from(software, current_user.id, '')
        @comment.parent_id = @parent.id
        respond_to do |format|
          format.js {}
        end
    end
    
    def create
      curent_user = current_user || current_editor
      @software = Software.find params[:comment][:commentable_id]
      @comment = Comment.build_from @software, current_user.id, comment_params[:body]
      @comment.parent_id = params[:comment][:parent_id]
      if @comment.save
        respond_to :js
      else
        flash[:error] = 'Un problème est survenu lors de l\'ajout de votre commentaire.'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body, :commentable_name, :commentable_id, :commentable_type)
    end
end