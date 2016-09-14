class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]
  before_action :set_reserva

  # GET /passengers
  # GET /passengers.json
  def index
    @passengers = @reserva.passengers
  end

  # GET /passengers/1
  # GET /passengers/1.json
  def show
  end

  # GET /passengers/new
  def new
    @passenger = @reserva.passengers.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers
  # POST /passengers.json
  def create
    @passenger = @reserva.passengers.new(passenger_params)

    respond_to do |format|
      if @reserva.save && @passenger.save
        format.html { redirect_to reserva_passenger_path(@reserva, @passenger),
                      notice: 'Passenger was successfully created.' }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1
  # PATCH/PUT /passengers/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to @passenger, notice: 'Passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passengers_url, notice: 'Passenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passenger_params
      params.require(:passenger).permit(:name, :documento, :nacimiento)
    end

    def set_reserva
      @reserva ||= Reserva.find params[:reserva_id]
    end
end
