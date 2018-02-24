class UsersController < ApplicationController
	before_action :require_login, :except => [:index, :create, :show]
  
  def index
  end
  def create
  	@count = 0
  	user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  	if user.valid?
  		session[:user_id] = user.id
  		redirect_to '/songs'
  	else
  		flash[:error] = user.errors.full_messages
  		redirect_to '/'
  	end
  end

  def show
  	@count = 0
  	@user = User.find(params[:id])
  	@users = User.find(params[:id]).liked_songs
  end

  def destroy
  	User.find(current_user.id).destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end
end
