class CommentsController < ApplicationController
  before_action :require_signin

  def index
    redirect_to root_path
  end

  def create

    @post = Post.find_by!(slug: params[:post_id])

    if params[:parent_id].empty?
      @comment = @post.comments.new(content: params[:content])
    else
      @parent_comment = Comment.find(params[:parent_id])
      @comment = @parent_comment.subcomments.new(content: params[:content], post: @post)
    end

    @comment.user = current_user
    @comment.save

    redirect_to @post
  end

end
