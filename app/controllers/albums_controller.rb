class AlbumsController < ApplicationController
 
  before_filter :require_login, :only => :new

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])

    if current_user.albums.length > 1 && !current_user.is_paid
      redirect_to signup_url, :notice => "You must have a paid account to create more than two albums. Sign up below!"
    else 
      @album.user_id = current_user.id
      @album.save
      redirect_to albums_url 
    end 
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      redirect_to albums_url
    else 
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_url
  end
end
