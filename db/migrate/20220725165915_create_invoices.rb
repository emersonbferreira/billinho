class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :invoice_amount, null: false
      t.date :due_date, null: false
      t.references :enrollment, foreign_key: true, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
