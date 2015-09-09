class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :rut
      t.string :email
      t.string :phone
      t.string :contact_name
      t.string :contact_last_name
      t.string :token

      t.timestamps null: false
    end
    add_index :companies, :name, unique: true
    add_index :companies, :token,   unique: true
  end
end
