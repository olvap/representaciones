class Reserva < ActiveRecord::Base
  belongs_to :operator

  has_many :trips
  has_many :passengers, through: :trips

  has_many :payments
  has_many :deposits
  has_many :movements

  def to_s
    "#{operator} - #{salida}"
  end

  after_initialize do
    self.monto ||= 0
  end
end
