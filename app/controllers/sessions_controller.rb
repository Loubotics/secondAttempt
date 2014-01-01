class SessionsController < ApplicationController
  def new
    redirect_to current_user unless !signed_in?
  end

  def create
  	user = User.authenticate(params[:email],params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to user, :notice => 'Logged in'
  	else
  		redirect_to root_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to log_in_path
  end
end
