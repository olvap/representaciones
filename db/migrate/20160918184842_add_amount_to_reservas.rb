class AddAmountToReservas < ActiveRecord::Migration
  def change
    add_money :reservas, :amount
    remove_column :reservas, :monto, :integer
  end
end
