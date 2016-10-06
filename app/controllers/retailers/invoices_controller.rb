class Retailers::InvoicesController < InvoicesController
  before_action :set_namespace
  before_action :set_operators, except: [:index, :show, :destroy]

  def index
    @invoices = Invoice.select do |invoice|
      invoice.operator.is_a? Retailer
    end
  end

  private

  def set_operators
    @operators = Retailer.all
  end

  def set_namespace
    @namespace = :retailers
  end
end
