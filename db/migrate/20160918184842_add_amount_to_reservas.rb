class AddAmountToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :amount_cents, :integer, default: 0
    add_column :reservas, :amount_currency, :string
    remove_column :reservas, :monto, :integer
  end
end
