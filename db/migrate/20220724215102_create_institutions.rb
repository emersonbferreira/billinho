class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name, limit: 600, null: false, unique: true
      t.string :cnpj, limit: 18, null: false, unique: true
      t.string :kind, limit: 12

      t.timestamps
    end
  end
end
