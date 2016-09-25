class Operator < ActiveRecord::Base
  TAX_CATEGORIES =
    ['R.INSCRIPTO', 'MONOTRIBUTO', 'EXENTO'].freeze

  has_many :movements

  validates :tax_category, inclusion: TAX_CATEGORIES

  def to_s
    name
  end
end
