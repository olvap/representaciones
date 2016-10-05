class Wholesalers::InvoicesController < InvoicesController
  before_action :set_operators, only: [:new, :edit]

  def index
    @invoices = Invoice.select do |invoice|
      invoice.operator.is_a? Wholesaler
    end
  end

  private

  def set_operators
    @operators = Wholesaler.all
  end
end
