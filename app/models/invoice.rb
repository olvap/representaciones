class Invoice < ActiveRecord::Base
  INVOICE_TYPES = %w{ A B NC }

  belongs_to :operator

  validates :invoice_type, inclusion: INVOICE_TYPES

  monetize :taxed_21_cents
  monetize :taxed_105_cents
  monetize :not_taxed_cents
  monetize :exempt_cents

  def tax_21_cents
    (taxed_21_cents * 0.21).to_i
  end

  def tax_105_cents
    (taxed_105_cents * 0.105).to_i
  end

  def total_cents
    taxed_21_cents + taxed_105_cents + tax_21_cents + tax_105_cents +
      exempt_cents + not_taxed_cents
  end
end