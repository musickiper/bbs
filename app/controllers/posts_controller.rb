class PostsController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(page: params[:page]).order('created_at DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = @post.user
    @comments = @post.comments
    @comment = Comment.new

    @post.update!(views: @post.views + 1)

    if current_user
      @like = current_user.likes.find_by(post_id: @post.id)
    end

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    unless current_user?(@post.user)
      redirect_to root_path, danger: "You aren't authorized!"
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, success: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    unless current_user?(@post.user)
      redirect_to root_path, danger: "You aren't authorized!"
    end

    @post.destroy
    redirect_to posts_url, success: 'Post was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find_by!(slug: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :views, :body, :thumbnail_image)
  end

end
