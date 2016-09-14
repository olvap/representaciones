class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.integer :monto
      t.belongs_to :reserva, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
