class SessionsController < ApplicationController
  before_action :require_not_logged_in, only: [:new]

  def new
    @user = User.new
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]

    @user = User.find_by_credentials(email, password)

    if @user
      login!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = "Invalid credentials"
      @user = User.new(email: email)
      render :new
    end
  end

  def destroy
    if logged_in?
      logout!
      redirect_to new_session_url
    else
      redirect_to users_url
    end
  end

  private
  def require_not_logged_in
    redirect_to users_url if logged_in?
  end

end
