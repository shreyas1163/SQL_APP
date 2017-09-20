# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ----------Starting of Employee insertion----------------

#
ActiveRecord::Base.establish_connection
['employees','employee_cities'].each do |table|
  table.classify.constantize.connection.execute("SET FOREIGN_KEY_CHECKS = 0")
  table.classify.constantize.connection.execute("TRUNCATE #{table}")
  table.classify.constantize.connection.execute("SET FOREIGN_KEY_CHECKS = 1")
end
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
# ----------Ending of Employee insertion----------------
# ----------Starting of Employee_city insertion----------------

employee_city_create=Array.new
city_name=[
    "Ambaji","Ayodhya ","Abids","Agra","Ahmedabad","Ahmednagar","Alappuzha",
    "Allahabad","Alwar","Akola","Alibag","Almora","Amlapuram","Amravati","Amritsar","Anand",
    "Anandpur Sahib","Angul","Anna Salai","Arambagh","Asansol","Ajmer","Amreli","Aizawl","Agartala","Aligarh","Auli","Aurangabad","Azamgarh","Aurangabad",
    "Baran","Bettiah","Badaun","Badrinath ","Balasore","Banaswara","Bankura","Ballia","Bardhaman","Baripada","Barrackpore","Barnala",
    "Barwani","Beed","Beawar","Bellary","Bhadohi","Bhadrak","Bharuch","Bhilai","Bhilwara","Bhiwani","Bidar","Bilaspur","Bangalore","Bhind",
    "Bhagalpur","Bharatpur","Bhavnagar","Bhopal","Bhubaneshwar","Bhuj","Bilimora","Bijapur","Bikaner","Bodh Gaya","Bokaro","Bundi","Barasat",
    "Bareilly","Basti","Bijnor","Burhanpur","Buxur","Calangute","Chandigarh","Chamba","Chandausi","Chandauli","Chandrapur","Chhapra",
    "Chidambaram","Chiplun","Chhindwara","Chitradurga","Chittoor","Cooch Behar","Chennai","Chittaurgarh","Churu","Coimbatore","Cuddapah",
    "Cuttack","Dahod","Dalhousie","Davangere","Dehri","Dewas","Dwarka","Dehradun","Delhi","Deoria","Dhanbad","Dharamshala ","Dispur",
    "Dholpur","Diu Island ","Durgapur","Didwana","Ernakulam","Etah","Etawah","Erode","Faridabad","Ferozpur","Faizabad","Gandhinagar",
    "Gangapur","Garia","Gaya","Ghaziabad","Godhra","Gokul","Gonda","Gorakhpur","Greater Mumbai","Gulbarga","Guna","Guntur","Gurgaon",
    "Greater Noida","Gulmarg","Hanumangarh","Haflong ","Haldia","Haridwar","Hajipur","Haldwani","Hampi","Hapur","Hubli","Hardoi",
    "Hyderabad","Guwahati","Gangtok","Gwalior","Imphal","Indore","Itanagar","Itarsi","Jabalpur","Jagadhri","Jalna","Jamalpur","Jhajjar",
    "Jhalawar","Jaipur","Jaisalmer","Jalandhar","Jammu","Jamshedpur","Jhansi","Jaunpur","Jodhpur","Junagadh","Jalore","Kishanganj","Katihar",
    "Kanpur","Kangra ","Kasauli","Kapurthala","Kanchipuram","Karnal","Karaikudi","Kanyakumari","Katni","Khajuraho","Khandala","Khandwa",
    "khargone","Kishangarh","Kochi","Kodaikanal","Kohima","Kolhapur","Kolkata","Kollam","Kota","Kottayam","Kovalam","Kozhikode","Kumbakonam",
    "Kumarakom","Kurukshetra","Lalitpur","Latur","Lucknow","Ludhiana","Lavasa","Leh","Laxmangarh","Madikeri","Madurai","Mahabaleshwar ",
    "Mahabalipuram","Mahbubnagar","Manali","Mandu Fort ","Mangalore","Malegaon","Manipal","Margoa","Mathura","Meerut","Mirzapur","Mohali",
    "Morena","Motihari","Moradabad","Mount Abu","Mumbai","Munger","Munnar","Mussoorie","Mysore","Muzaffarnagar","Mokokchung","Muktsar",
    "Nagpur","Nagaon","Nagercoil","Naharlagun","Naihati","Nainital","Nalgonda","Namakkal","Nanded","Narnaul","Nasik","Nathdwara",
    "Navsari","Neemuch","Noida","Ooty","Orchha","Palakkad","Palanpur","Pali","Palwal","Panaji","Panipat","Panvel","Pathanamthitta",
    "Pandharpur","Patna Sahib","Panchkula","Patna","Periyar","Phagwara","Pilibhit","Pinjaur","Pollachi","Pondicherry","Ponnani",
    "Porbandar","Port Blair","Porur","Pudukkottai","Punalur","Pune","Puri","Purnia","Pushkar","Patiala","Raxual","Rajkot","Rameswaram",
    "Rajahmundry","Ranchi","Ratlam","Raipur","Rewa","Rewari","Rishikesh","Rourkela","Sitamrahi","Sagar","Sangareddy","Saharanpur","Salem",
    "Salt Lake","Samastipur","Sambalpur","Sambhal","Sanchi","Sangli","Sarnath","Sasaram","Satara","Satna","Secunderabad","Sehore","Serampore",
    "Sangrur","Sirhind","Shillong","Shimla","Shirdi ","ShivaGanga","Shivpuri","Silvassa","Singrauli","Sirsa","Sikar","Siwan","Somnath",
    "Sonipat","Sopore ","Srikakulam","Srirangapattna","Srinagar","Sultanpur","Surat","Surendranagar","Suri","Tawang","Tezpur","Thrippunithura",
    "Thrissur","Tiruchchirappalli","Tirumala","Tirunelveli","Thiruvannamalai","Tirur","Thalassery","Thanjavur","Thekkady","Theni",
    "Thiruvananthpuram ","Thiruvannamalai ","Tirupati","Trichy","Trippur","Tumkur","Tuni","Udaipur","Udhampur","Udupi","Ujjain",
    "Unnao","Ujjain Fort ","Vidisha","Vadodra","Valsad","Vapi","Varanasi","Varkala","Vasco da Gama","Vellore","Vishakhapatnam","Vijayawada",
    "Vizianagaram","Vrindavan","Warangal","Washim","Yamunanagar","Yelahanka"]

last_count=EmployeeCity.count(:employee_id)

10000.times do |employee_city |
  last_count=last_count+1
  employee_city_create.push({city_name: city_name.sample,employee_id: last_count})
  puts "creating employee_cities #{employee_city} "
end



EmployeeCity.bulk_insert do |employee_city|
  employee_city_create.each do |values|
    employee_city.add(values)
  end
  puts "inserted #{employee_city}"
end
puts "completed insertion"
# ----------Ending  of Employee_city insertion----------------
