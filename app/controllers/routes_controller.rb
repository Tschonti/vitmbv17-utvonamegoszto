class RoutesController < ApplicationController
  before_action :set_route, only: %i[ show edit update destroy ]

  # GET /routes or /routes.json
  def index
    @routes = Route.all
  end

  # GET /routes/1 or /routes/1.json
  def show
    unless user_signed_in?
      redirect_to root_path,{ notice: "Nem vagy bejelentkezve!"} and return
    end
    @hike_efforts = @route.efforts.filter {|effort| effort.effort_type == 1}
    @run_efforts = @route.efforts.filter {|effort| effort.effort_type == 2}
    @bike_efforts = @route.efforts.filter {|effort| effort.effort_type == 3}

  end

  # GET /routes/new
  def new
    unless user_signed_in?
      redirect_to root_path,{ notice: "Nem vagy bejelentkezve!"} and return
    end
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
    unless user_signed_in?
      redirect_to root_path,{ notice: "Nem vagy bejelentkezve!"} and return
    end
  end

  # POST /routes or /routes.json
  def create
    @route = Route.new(route_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to route_url(@route), notice: "Route was successfully created." }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1 or /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to route_url(@route), notice: "Route was successfully updated." }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1 or /routes/1.json
  def destroy
    @route.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def route_params
      params.require(:route).permit(:name, :link, :distance, :elevation)
    end
end
