class Movement < ActiveRecord::Base
  belongs_to :operator
  belongs_to :reserva
end
