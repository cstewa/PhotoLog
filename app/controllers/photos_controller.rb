class PhotosController < ApplicationController
  before_filter :require_login, :only => :new

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
      redirect_to album_url(@photo.album.id)
    else
      render :new
    end  
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    comment = Comment.new
    comment.content = params[:pic][:comment] + " - " + current_user.email
    comment.save

    if @photo.comments << comment
      redirect_to album_photo_url(@photo.album.id, @photo.id)
    else 
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_url
  end
end
