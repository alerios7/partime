class AddColumnsToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :college, :string
    add_column :workers, :career, :string
    add_column :workers, :address, :string
  end
end
