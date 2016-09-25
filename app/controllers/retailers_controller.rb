class RetailersController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]

  def index
    @operators = Retailer.all
  end

  def new
    @operator = Retailer.new
  end

  def create
    @operator = Retailer.new(retailer_params)

    respond_to do |format|
      if @operator.save
        format.html { redirect_to @operator, notice: 'Minorista creado.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @operator.update(retailer_params)
        format.html { redirect_to @operator, notice: 'Minorista salvado.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to retailers_url, notice: 'Minorista borrado.' }
    end
  end

  private
    def set_operator
      @operator = Retailer.find(params[:id])
    end

    def retailer_params
      params.require(:retailer).permit(
        :name, :address, :phone, :file_number, :cuit, :tax_category)
    end
end
