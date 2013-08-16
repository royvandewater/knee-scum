class Api::V1::AreasController < ApplicationController
  before_action :set_area, :only => [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @areas = Area.all
    respond_with @areas
  end

  def show
    respond_with @area
  end

  def create
    @area = Area.new(area_params)

    @area.save
    respond_with @area
  end

  def update
    @area.update(area_params)
    respond_with @area
  end

  def destroy
    @area.destroy
    respond_with @area
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_area
    @area = Area.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def area_params
    params.require(:area).permit(:name, :description)
  end
end
