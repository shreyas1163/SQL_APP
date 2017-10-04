require 'statistics_module.rb'
require 'modules/Difference_finder.rb'
class Employee < ActiveRecord::Base
	has_one :employee_city , dependent: :destroy
	include  Statistics

	# ---------this is used to create records for employee table-----------------

	def self.records_create
		employee_result=Array.new

		1000000.times do |employees|
			employee_name = ('a'..'z').to_a.shuffle.first(5).join.titleize
			salary = rand(10000..100000)
			manager_id = rand(100..400)
			employee_result.push({name:employee_name,salary: salary,manager_id: manager_id})
			puts "creating employees #{employees} "
		end

		puts "inserting started"
		Employee.bulk_insert do |employees|
			employee_result.each do |values|
				employees.add(values)
			end
			puts "inserted #{employees}"
		end
		puts "employee insertion complete"

	end


	#--------this is used for getting the result hash it calls the module statistics_module.rb-----

	def self.generate_hash
    Statistics.result_hash
	end
  def self.difference_finder(folder1, folder2)
		Folders.folder(folder1, folder2)
	end
	#--------this is used for deleteing all the records -----

	def self.records_delete_all
			Employee.destroy_all
		end

	#--------this is used for truncating all tables -----
	def self.records_truncate
		['employees','employee_cities'].each do |table|
  			table.classify.constantize.connection.execute("SET FOREIGN_KEY_CHECKS = 0")
  			table.classify.constantize.connection.execute("TRUNCATE #{table}")
			table.classify.constantize.connection.execute("SET FOREIGN_KEY_CHECKS = 1")
		end
	end
end
