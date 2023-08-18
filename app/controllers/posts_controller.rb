# app/controllers/posts_controller.rb
class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
      posts = Post.all
      render json: posts
    end
  
    def show
      post = Post.find(params[:id])
      render json: post
    end
  
    def create
        post = current_user.posts.build(post_params)
        category = Category.find(params[:category_id]) # Assuming you have a category_id parameter in your form
        post.category = category if category # Associate the post with the selected category
    
        if post.save
          render json: post, status: :created
        else
          render json: { error: "Failed to create post" }, status: :unprocessable_entity
        end
      end
      
    def update
      post = current_user.posts.find(params[:id])
      if post.update(post_params)
        render json: post
      else
        render json: { error: "Failed to update post" }, status: :unprocessable_entity
      end
    end
  
    def destroy
      post = current_user.posts.find(params[:id])
      post.destroy
      head :no_content
    end
  
    def like
      post = Post.find(params[:id])
      post.liked_by current_user
      render json: post
    end
  
    def dislike
      post = Post.find(params[:id])
      post.disliked_by current_user
      render json: post
    end
  
    private
    def post_params
      params.require(:post).permit(:title, :content, :category_id, :image)
    end
  end
  