class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    email = params[:user][:email],
    password = params[:user][:password]

    @user = User.find_by_credentials(email, password)

    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to users_url
    else
      @user = User.new(emali: email)
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      @current_user = nil
      session[:session_token] = nil
      redirect_to new_session_url
    else
      redirect_to users_url
    end
  end

end
