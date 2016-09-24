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

  test "valid invoice types" do
    %w{ A B NC }.each do |type|
      @invoice.invoice_type = type
      @invoice.validate
      assert @invoice.errors[:invoice_type].empty?
    end
  end

  test "invalid invoice types" do
    @invoice.invoice_type = 'C'
    @invoice.validate
    assert_not @invoice.errors[:invoice_type].empty?
  end
end
