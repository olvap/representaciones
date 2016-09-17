class MoveMovementsToOperator < ActiveRecord::Migration
  def change
    remove_column :movements, :reserva_id, :integer
    add_column :movements, :operator_id, :integer, index: true
  end
end
