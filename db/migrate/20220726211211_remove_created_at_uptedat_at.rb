class RemoveCreatedAtUptedatAt < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :created_at
  end
end
