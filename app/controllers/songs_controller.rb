class SongsController < ApplicationController
	before_action :require_login
  def index
		@songs = Song.all
		@count = 0
  end
  
  def create
  	@count = 0
  	@song = Song.create(artist: params[:artist], title: params[:title], user: current_user)
  	
  	if @song.valid?
  		redirect_to '/songs'
  	else
  		flash[:error] = @song.errors.full_messages
  		redirect_to '/songs'
  	end
  end

  def add
  	@count = 0
  	@count += 1 
  	redirect_to '/songs'
  end

  def show
  	@count = 0
  	@song = Song.find(params[:song_id])
  	@users = Song.find(params[:song_id]).liked_users
  end
end
