class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.nil?
      redirect_to login_path
    elsif @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    end  	
  end

  def destroy
    reset_session
    redirect_to root_path  	
  end
end
