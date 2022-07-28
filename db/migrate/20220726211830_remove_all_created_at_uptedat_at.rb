class RemoveAllCreatedAtUptedatAt < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :updated_at
    remove_column :invoices, :created_at
    remove_column :invoices, :updated_at
    remove_column :enrollments, :created_at
    remove_column :enrollments, :updated_at
    remove_column :institutions, :created_at
    remove_column :institutions, :updated_at
  end
end