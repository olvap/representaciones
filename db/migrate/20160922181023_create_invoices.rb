class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :date
      t.belongs_to :operator, index: true, foreign_key: true
      t.string :invoice_type
      t.integer :sales_point
      t.integer :number
      t.integer :taxed_21
      t.integer :taxed_105
      t.integer :not_taxed
      t.integer :exempt

      t.timestamps null: false
    end
  end
end
