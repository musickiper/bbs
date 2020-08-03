class LikesController < ApplicationController
  before_action :require_signin

  def index
    redirect_to post_path(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create!(user: current_user)
    redirect_to @post
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy
    post = Post.find(params[:post_id])
    redirect_to post
  end
end
