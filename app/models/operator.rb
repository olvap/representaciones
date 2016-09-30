class Operator < ActiveRecord::Base
  TAX_CATEGORIES =
    ['R.INSCRIPTO', 'MONOTRIBUTO', 'EXENTO'].freeze

  has_many :movements
  has_many :invoices

  validates :tax_category, inclusion: TAX_CATEGORIES

  def to_s
    name
  end
end
