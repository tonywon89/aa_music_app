class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    session[:return_to] ||= request.referer
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to session.delete(:return_to)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
