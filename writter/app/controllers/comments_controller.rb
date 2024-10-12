class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
    load_and_authorize_resource
  
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params.merge(user: current_user))
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment added successfully!'
      else
        redirect_to post_path(@post), alert: 'Error adding comment.'
      end
    end
  
    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to post_path(@comment.post), notice: 'Comment updated successfully!'
      else
        render :edit
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(@comment.post), notice: 'Comment deleted successfully!'
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  