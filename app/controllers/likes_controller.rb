class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = post.likes.build(user: current_user, is_like: params[:is_like])
    if like.save
      render json: like
    else
      render json: { error: "Failed to like/dislike post" }, status: :unprocessable_entity
    end
  end
end