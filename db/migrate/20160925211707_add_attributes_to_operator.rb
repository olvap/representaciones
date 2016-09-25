class AddAttributesToOperator < ActiveRecord::Migration
  def change
    add_column :operators, :cuit, :string
    add_column :operators, :address, :string
    add_column :operators, :phone, :string
    add_column :operators, :tax_category, :string
    add_column :operators, :file_number, :string
  end
end
