class Retailers::InvoicesController < InvoicesController
  before_action :set_operators, only: [:new, :edit]

  def index
    @invoices = Invoice.select do |invoice|
      invoice.operator.is_a? Retailer
    end
  end

  private

  def set_operators
    @operators = Retailer.all
  end
end
