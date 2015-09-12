class AddCompanyRefToEmployer < ActiveRecord::Migration
  def change
    add_foreign_key :employers, :users, column: :company_id
  end
end
