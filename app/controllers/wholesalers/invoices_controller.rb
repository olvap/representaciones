class Wholesalers::InvoicesController < InvoicesController
  before_action :set_namespace
  before_action :set_operators, except: [:index, :show, :destroy]

  def index
    @invoices = Invoice.select do |invoice|
      invoice.operator.is_a? Wholesaler
    end
  end

  private

  def set_operators
    @operators = Wholesaler.all
  end

  def set_namespace
    @namespace = :wholesalers
  end
end
