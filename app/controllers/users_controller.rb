class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create, :show]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by!(slug: params[:id])
    @posts = Post.where(:user_id => @user.id).paginate(page: params[:page]).order('created_at DESC')
  end

  def new
    if current_user
      redirect_to root_path
    end

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, success: "Thanks for signing up!"
    else
      render :new
    end

  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path,
                success: "Your account is successfully deleted!"
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user,
                  success: "Your account has updated successfully!"
    else
      render :edit
    end
  end

  private

  def require_correct_user
    @user = User.find_by!(slug: params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def user_params
    params.require(:user)
        .permit(:email, :username, :password, :password_confirmation, :profile_image)
  end

end
