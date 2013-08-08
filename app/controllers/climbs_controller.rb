class ClimbsController < ApplicationController
  before_action :set_climb, :only => [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @climbs = Climb.all
    respond_with @climbs
  end

  def show
    respond_with @climb
  end

  def create
    @climb = Climb.new(climb_params)

    @climb.save
    respond_with @climb
  end

  def update
    @climb.update(climb_params)
    respond_with @climb
  end

  def destroy
    @climb.destroy
    respond_with @climb
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb
      @climb = Climb.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def climb_params
      params.require(:climb).permit(:name, :difficulty)
    end
end
