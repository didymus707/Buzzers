class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:sessions][:username])

    if @user
      log_in @user
      redirect_to root_path
      flash[:notice] = 'You are signed in'
    else
      flash[:alert] = "Incorrect username or Sign up if you don't have an account"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
