class RoutesController < ApplicationController
  before_action :set_route, :only => [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @routes = Route.all
    respond_with @routes
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      respond_to do |format|
        format.html { redirect_to @route, :notice => 'Route was successfully created.' }
        format.json { respond_with @route }
      end
    else
      render :action => 'new'
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, :notice => 'Route was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_url, :notice => 'Route was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def route_params
      params.require(:route).permit(:name, :difficulty)
    end
end
