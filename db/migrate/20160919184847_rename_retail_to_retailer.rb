class RenameRetailToRetailer < ActiveRecord::Migration
  def up
    rename_column :reservas, :retail_id, :retailer_id
    Operator.where(type: 'Retail').update_all type: 'Retailer'
  end

  def down
    rename_column :reservas, :retailer_id, :retail_id
    Operator.where(type: 'Retailer').update_all type: 'Retail'
  end
end
