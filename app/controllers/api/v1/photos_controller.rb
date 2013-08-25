class Api::V1::PhotosController < Api::V1::ApiController
  before_filter :require_authentication, :except => [:index, :show]
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
    @climb = Climb.find_by :area_id => params[:area_id], :id => params[:climb_id]
  end

  def set_photo
    @photo = @climb.photos.find(params[:id])
  end

  def photo_params
    params.permit(:title, :file)
  end

  def photo_url(photo)
    api_v1_area_climb_photo_url @climb.area_id, @climb.id, photo.id
  end
end
