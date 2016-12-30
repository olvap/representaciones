class Operator < ActiveRecord::Base
  TAX_CATEGORIES =
    ['R.INSCRIPTO', 'MONOTRIBUTO', 'EXENTO'].freeze

  has_many :movements

  validates :tax_category, inclusion: TAX_CATEGORIES
  validates_presence_of :name, :cuit

  def to_s
    name
  end
end
