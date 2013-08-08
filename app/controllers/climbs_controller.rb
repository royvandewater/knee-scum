class ClimbsController < ApplicationController
  before_action :set_climb, :only => [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @climbs = Climb.all
    respond_with @climbs
  end

  def show
  end

  def new
    @climb = Climb.new
  end

  def edit
  end

  def create
    @climb = Climb.new(climb_params)

    if @climb.save
      respond_to do |format|
        format.html { redirect_to @climb, :notice => 'Climb was successfully created.' }
        format.json { respond_with @climb }
      end
    else
      render :action => 'new'
    end
  end

  def update
    if @climb.update(climb_params)
      respond_with @climb, :notice => 'Climb was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @climb.destroy
    redirect_to climbs_url, :notice => 'Climb was successfully destroyed.'
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
