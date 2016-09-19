class RemoveOperatorIdColumnFromReserva < ActiveRecord::Migration
  def change
    remove_column :reservas, :operator_id
  end
end
