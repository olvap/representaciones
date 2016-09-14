class Trip < ActiveRecord::Base
  belongs_to :reserva
  belongs_to :passenger
end
