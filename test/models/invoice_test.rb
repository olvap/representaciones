require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  setup do
    @invoice = invoices :venta
  end

  test "tax_21 calculation" do
    assert_equal 210, @invoice.tax_21_cents
  end

  test "tax_105 calculation" do
    assert_equal 105, @invoice.tax_105_cents
  end

  test "total calculation" do
    assert_equal 4315, @invoice.total_cents
  end
end
