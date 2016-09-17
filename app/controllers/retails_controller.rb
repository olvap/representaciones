class RetailsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]

  def index
    @operators = Retail.all
  end

  def new
    @operator = Retail.new
  end

  def create
    @operator = Retail.new(retails_params)

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
      if @operator.update(retails_params)
        format.html { redirect_to @operator, notice: 'Minorista salvado.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to retails_url, notice: 'Minorista borrado.' }
    end
  end

  private
    def set_operator
      @operator = Retail.find(params[:id])
    end

    def retails_params
      params.require(:retail).permit(:name)
    end
end
