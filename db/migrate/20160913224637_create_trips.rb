class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :reserva, index: true, foreign_key: true
      t.belongs_to :passenger, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
