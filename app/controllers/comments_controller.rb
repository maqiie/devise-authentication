# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      post = Post.find(params[:post_id])
      comments = post.comments
      render json: comments
    end
  
    def create
      post = Post.find(params[:post_id])
      comment = post.comments.build(comment_params)
      comment.user = current_user
  
      if comment.save
        render json: comment, status: :created
      else
        render json: { error: "Failed to create comment" }, status: :unprocessable_entity
      end
    end
  
    def show
      comment = Comment.find(params[:id])
      render json: comment
    end
  
    def destroy
      comment = current_user.comments.find(params[:id])
      comment.destroy
      head :no_content
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  
