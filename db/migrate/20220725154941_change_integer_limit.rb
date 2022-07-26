class ChangeIntegerLimit < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :tel, :integer, limit: 8
  end
end
