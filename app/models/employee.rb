require 'emp.rb'
class Employee < ActiveRecord::Base
	has_one :employee_city , dependent: :destroy
	include  Stats

	def self.records_create
    employee_result=Array.new
    1000000.times do |record|
      person_name = ('a'..'z').to_a.shuffle.first(8).join
      salary = rand(10000..100000)
      manager_id = rand(100..400)
      if(employee_result.count==0)
        employee_result.push({:name=>person_name,:salary=> salary,:manager_id=> manager_id})
      else
        employee_result.push({:name=>person_name,:salary=> salary,:manager_id=> manager_id})
      end
    end

    Employee.bulk_insert do |worker|
      employee_result.each do |attrs|
        worker.add(attrs)
      end
    end

 		 	end
	def self.get_hash

    Stats.result_hash
	end
	def self.records_delete_all
			Employee.destroy_all
		end

	def self.records_truncate
		ActiveRecord::Base.establish_connection
		ActiveRecord::Base.connection.tables.each do |table|
			next if table == 'schema_migrations'
			table.classify.constantize.connection.execute("SET FOREIGN_KEY_CHECKS = 0")
			table.classify.constantize.connection.execute("TRUNCATE #{table}")
			table.classify.constantize.connection.execute("SET FOREIGN_KEY_CHECKS = 1")
		end
	end
end
