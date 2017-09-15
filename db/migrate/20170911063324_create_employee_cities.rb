class CreateEmployeeCities < ActiveRecord::Migration
  def change
    create_table :employee_cities do |t|
      t.string :city_name
      t.references :employee, index: {unique:true}, foreign_key: true
    end
  end
end
