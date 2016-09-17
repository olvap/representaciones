class Reserva < ActiveRecord::Base
  belongs_to :wholesaler
  belongs_to :retail

  has_many :trips
  has_many :passengers, through: :trips

  has_many :payments, through: :wholesaler, source: :movements
  has_many :deposits, through: :retail, source: :movements

  def to_s
    "#{wholesaler} - #{salida}"
  end

  after_initialize do
    self.monto ||= 0
  end
end
