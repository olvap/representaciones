class Invoice < ActiveRecord::Base
  belongs_to :operator

  monetize :taxed_21_cents
  monetize :taxed_105_cents
  monetize :not_taxed_cents
  monetize :exempt_cents
end
