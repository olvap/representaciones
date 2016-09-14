class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :documento
      t.date :nacimiento

      t.timestamps null: false
    end
  end
end
