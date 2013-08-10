class PhotosController < ApplicationController
  before_action :set_climb
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]
  protect_from_forgery :with => :null_session
  respond_to :json

  def index
    @photos = @climb.photos.all
    respond_with @photos
  end

  def show
    respond_with @photo
  end

  def create
    @photo = @climb.photos.create(photo_params)
    respond_with @photo
  end

  def update
    @photo.update(photo_params)
    respond_with @photo
  end

  def destroy
    @photo.destroy
    respond_with @photo
  end

  private
  def set_climb
    @climb = Climb.find(params[:climb_id])
  end

  def set_photo
    @photo = @climb.photos.find(params[:id])
  end

  def photo_params
    params.permit(:title, :description, :file)
  end

  def photo_url(photo)
    climb_photo_path @climb, photo
  end
end
