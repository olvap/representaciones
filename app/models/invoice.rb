class Invoice < ActiveRecord::Base
  INVOICE_TYPES = %w( A B NC ).freeze

  belongs_to :operator, required: true

  validates :invoice_type, inclusion: INVOICE_TYPES
  validates_presence_of [:sales_point, :number, :date]

  monetize :taxed_21_cents
  monetize :taxed_105_cents
  monetize :not_taxed_cents
  monetize :exempt_cents
  monetize :perception_cents

  default_scope { order(date: 'DESC') }

  def operator_namespace
    operator.class.to_s.pluralize.downcase
  end

  def tax_21
    tax_21_cents / 100.0
  end

  def tax_105
    tax_105_cents / 100.0
  end

  def total
    total_cents / 100.0
  end

  def tax_21_cents
    (taxed_21_cents * 0.21).to_i
  end

  def tax_105_cents
    (taxed_105_cents * 0.105).to_i
  end

  def total_cents
    taxed_21_cents + taxed_105_cents + tax_21_cents + tax_105_cents +
      exempt_cents + not_taxed_cents + perception_cents
  end

  def full_number
    "#{ invoice_type } %04d-%08d" % [sales_point, number]
  end
end
