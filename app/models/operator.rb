class Operator < ActiveRecord::Base
  has_many :movements

  def to_s
    name
  end
end
