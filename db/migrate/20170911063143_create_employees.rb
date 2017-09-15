class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :salary
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
