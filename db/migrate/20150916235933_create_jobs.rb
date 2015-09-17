class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :body
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps null: false
    end
  end
end
