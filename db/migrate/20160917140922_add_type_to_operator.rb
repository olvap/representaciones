class AddTypeToOperator < ActiveRecord::Migration
  def change
    add_column :operators, :type, :string

    remove_column :reservas, :operator_id, :integer
    add_column :reservas, :wholesaler_id, :integer, index: true
    add_column :reservas, :retail_id, :integer, index: true
  end
end
