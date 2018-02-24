class SessionsController < ApplicationController
	def new
  end
  def create
  	@users = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  	if @users
  		session[:user_id] = @users.id
  		redirect_to '/songs'
  	else
  		flash[:error] = ["Email or password is wrong"]
  		redirect_to '/'
  	end
  end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end
end
