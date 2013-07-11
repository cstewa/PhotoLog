class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])
  end

  def create
    @photo = Photo.new(params[:photo])
    @album_id = params[:album_id]
    @photo.album_id = @album_id
    if @photo.save
      redirect_to album_path(@photo.album.id)
    else
      render :new
    end  
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      redirect_to redirect_to album_path(@photo.album.id)
    else 
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end
end
