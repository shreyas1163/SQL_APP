module Statistics
  def self.result_hash
    result ={}
    employee_count=Employee.group(:manager_id).count(:id).values
    employee_city=Employee.joins(:employee_city).group(:manager_id).pluck(:city_name,:name)
    employee_city.each_with_index do |value , index|
        result[value[1]]={}
        result[value[1]]["people_count"]=  employee_count[index]
        result[value[1]]["city_name"]=  value[0]
    end
    puts result
  end
end
