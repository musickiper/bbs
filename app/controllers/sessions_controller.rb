class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:email_or_username]) ||
        User.find_by(username: params[:email_or_username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user), success: "Welcome back, #{user.username}!"
      session[:intended_url] = nil
    else
      flash.now[:danger] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, success: "You are successfully signed out!"
  end

end
