class Api::V1::ClimbsController < ApplicationController
  before_filter :require_authentication, :except => [:index, :show]
  before_action :set_area
  before_action :set_climb, :only => [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @climbs = @area.climbs.includes :photos
    respond_with @climbs
  end

  def show
    respond_with @climb
  end

  def create
    @climb = @area.climbs.build climb_params

    @climb.save
    respond_with @climb
  end

  def update
    @climb.update climb_params
    respond_with @climb
  end

  def destroy
    @climb.destroy
    respond_with @climb
  end

  private
  def set_area
    @area = Area.find params[:area_id]
  end

  def set_climb
    @climb = @area.climbs.find params[:id]
  end

  def climb_params
    params.require(:climb).permit(:name, :difficulty, :description)
  end

  def climb_url(climb)
    api_v1_area_climb_url @area, climb
  end
end
