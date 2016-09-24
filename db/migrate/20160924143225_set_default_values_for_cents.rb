class SetDefaultValuesForCents < ActiveRecord::Migration
  def up
    change_column_default :invoices, :taxed_21_cents, 0
    change_column_default :invoices, :taxed_105_cents, 0
    change_column_default :invoices, :not_taxed_cents, 0
    change_column_default :invoices, :exempt_cents, 0
  end

  def down
    change_column_default :invoices, :taxed_21_cents, nil
    change_column_default :invoices, :taxed_105_cents, nil
    change_column_default :invoices, :not_taxed_cents, nil
    change_column_default :invoices, :exempt_cents, nil
  end
end
