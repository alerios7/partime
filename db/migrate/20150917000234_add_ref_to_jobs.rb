class AddRefToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :store, index: true, foreign_key: true
    add_reference :jobs, :worker, index: true, foreign_key: true
  end
end
