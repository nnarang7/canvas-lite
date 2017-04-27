class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.nil?
      redirect_to login_path
    elsif @user.password == params[:password]
      session[:user_id] = @user.id
      if @user.is_admin
        redirect_to courses_path
      else
        redirect_to dashboard_path
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
