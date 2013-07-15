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
    @album.user_id = current_user.id
    if @album.save
      redirect_to albums_url
    else
      render :new
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
