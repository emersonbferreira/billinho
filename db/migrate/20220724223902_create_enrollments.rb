class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.decimal :total_value, null: false, precision: 8, scale: 2
      t.integer :number_invoices, null: false
      t.integer :invoice_due_date, null: false
      t.references :institution, foreign_key: true, null: false
      t.references :student, foreign_key: true, null: false

      t.timestamps
    end
  end
end
