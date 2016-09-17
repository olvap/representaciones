class WholesalersController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]

  def index
    @operators = Wholesaler.all
  end

  def new
    @operator = Wholesaler.new
  end

  def create
    @operator = Wholesaler.new(wholesaler_params)

    respond_to do |format|
      if @operator.save
        format.html { redirect_to @operator, notice: 'Mayorista creado.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @operator.update(wholesaler_params)
        format.html { redirect_to @operator, notice: 'Mayorista salvado.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to wholesalers_url, notice: 'Mayorista borrado.' }
    end
  end

  private
    def set_operator
      @operator = Wholesaler.find(params[:id])
    end

    def wholesaler_params
      params.require(:wholesaler).permit(:name)
    end
end
