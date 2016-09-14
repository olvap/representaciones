class Passenger < ActiveRecord::Base
  has_many :trips
  has_many :reservas, through: :trips
end
