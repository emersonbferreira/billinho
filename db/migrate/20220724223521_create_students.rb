class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 200, null: false, unique: true
      t.string :cpf, limit: 11, null: false, unique: true
      t.date :birth_date
      t.integer :tel
      t.string :genere, limit: 1, null: false
      t.string :payment_method, limit: 6, null: false

      t.timestamps
    end
  end
end
