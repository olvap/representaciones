class AddPerceptionCentsToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :perception_cents, :integer, default: 0
  end
end
