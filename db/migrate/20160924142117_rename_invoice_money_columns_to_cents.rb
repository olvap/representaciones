class RenameInvoiceMoneyColumnsToCents < ActiveRecord::Migration
  def change
    rename_column :invoices, :taxed_21, :taxed_21_cents
    rename_column :invoices, :taxed_105, :taxed_105_cents
    rename_column :invoices, :not_taxed, :not_taxed_cents
    rename_column :invoices, :exempt, :exempt_cents
  end
end
