class Reserva < ActiveRecord::Base
  belongs_to :wholesaler
  belongs_to :retail

  has_many :trips
  has_many :passengers, through: :trips

  has_many :movements

  monetize :amount_cents

  def payments
    movements.where(operator: wholesaler)
  end

  def deposits
    movements.where(operator: retail)
  end

  def to_s
    "#{wholesaler} - #{salida}"
  end
end
