class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :email
      t.string :manager_name
      t.string :manager_lastname
      t.string :phone
      t.string :address
      t.references :company, index: true, foreign_key: true
      t.references :employer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
