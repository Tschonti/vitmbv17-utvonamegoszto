class EffortsController < ApplicationController
  before_action :set_effort, only: %i[ show edit update destroy ]

  # GET /efforts or /efforts.json
  def index
    @efforts = Effort.all
  end

  # GET /efforts/1 or /efforts/1.json
  def show
  end

  def showMine
  end
  # GET /efforts/new
  def new
    @effort = Effort.new
  end

  # GET /efforts/1/edit
  def edit
  end

  # POST /efforts or /efforts.json
  def create
    @effort = Effort.new(effort_params.merge(user_id: Current.user.id))

    respond_to do |format|
      if @effort.save
        format.json { render json: @effort, status: :created }
      else
        format.json { render json: {errors: @effort.errors}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /efforts/1 or /efforts/1.json
  def update
    respond_to do |format|
      if @effort.update(effort_params)
        format.json { render json: @effort, status: :ok }
      else
        format.json { render json: {errors: @effort.errors}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /efforts/1 or /efforts/1.json
  def destroy
    @effort.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_effort
      @effort = Effort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def effort_params
      params.require(:effort).permit(:time, :effort_type, :route_id)
    end
end
