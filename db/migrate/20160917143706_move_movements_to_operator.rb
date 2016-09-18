class MoveMovementsToOperator < ActiveRecord::Migration
  def change
    add_column :movements, :operator_id, :integer, index: true
  end
end
