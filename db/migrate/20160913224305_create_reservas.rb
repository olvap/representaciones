class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.date :salida
      t.string :hotel
      t.integer :monto
      t.belongs_to :operator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
