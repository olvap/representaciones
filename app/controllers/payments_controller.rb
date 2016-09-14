class PaymentsController < ApplicationController
  def index
    @movements = reserva.payments
  end

  def new
    @movement = reserva.payments.new
  end

  def create
    @movement = reserva.payments.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement, notice: 'Movement was successfully created.' }
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
    params.require(:movement).permit(:monto)
  end
end
