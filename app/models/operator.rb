class Operator < ActiveRecord::Base
  TAX_CATEGORIES =
    ['R.INSCRIPTO', 'MONOTRIBUTO', 'EXENTO'].freeze

  has_many :movements

  validates :tax_category, inclusion: { in: TAX_CATEGORIES , message: 'Debe seleccionar categoria.' }
  validates_presence_of :name
  validates_format_of :cuit, with: /\A\d{2}-\d{8}-\d\z/, message: 'Debe tener formato XX-XXXXXXXX-X'

  def to_s
    name
  end
end
