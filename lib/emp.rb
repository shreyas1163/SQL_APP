module Stats
  def self.result_hash
    result ={}
    500.times.each_with_index do |value , index|
      indexing=index+1
      if(indexing > 350)
        manager_name=Employee.where(:id => indexing).pluck(:name).join(" ")
        count_people=Employee.where(:manager_id => indexing).pluck(:id).count
        person_city=Employee.joins(:employee_city).where(:id=>indexing).pluck(:city_name ).join(" ")
        result[manager_name] = {}
        result[manager_name]["people_count"]=  count_people
        result[manager_name]["city_name"]=  person_city
      end
    end
    puts result
  end
end
