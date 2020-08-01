class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, success: "Thanks for signing up!"
    else
      render :new
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path,
                success: "Your account is successfully deleted!"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user,
                  success: "Your account has updated successfully!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
        .permit(:email, :username, :password, :password_confirmation)
  end

end
