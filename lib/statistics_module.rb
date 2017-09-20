module Statistics
  def self.result_hash
    result ={}
    manager_name=Employee.group(:manager_id).pluck(:name,:id)
    employee_count=Employee.group(:manager_id).count(:id).values
    employee_city=Employee.joins(:employee_city).group(:employee_id).where(id:manager_name.flatten).pluck(:city_name)
    manager_name.each_with_index do |value , index|
        result[value[0]]={}
        result[value[0]]["people_count"]=  employee_count[index]
        result[value[0]]["city_name"]=  employee_city[index]
    end
    puts result
  end
end
