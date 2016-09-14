class DepositsController < ApplicationController
  def index
    @movements = reserva.deposits
  end

  def new
    @movement = reserva.deposits.new
  end

  def create
    @movement = reserva.deposits.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement.reserva, notice: 'Movement was successfully created.' }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def reserva
    @reserva ||= Reserva.find(params[:reserva_id])
  end

  def movement_params
    params.require(:deposit).permit(:monto)
  end
end
