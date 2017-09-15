class EmployeeCity < ActiveRecord::Base
  belongs_to :employee

  # this is used to create 10,000 records in employee city

  def self.records_create_person_city
    employee_city_result=Array.new
   city_name=[
    "Ambaji","Ayodhya ","Abids","Agra","Ahmedabad","Ahmednagar","Alappuzha",
    "Allahabad","Alwar","Akola","Alibag","Almora","Amlapuram","Amravati","Amritsar","Anand",
    "Anandpur Sahib","Angul","Anna Salai","Arambagh","Asansol","Ajmer","Amreli","Aizawl","Agartala","Aligarh","Auli","Aurangabad","Azamgarh","Aurangabad",
    "Baran","Bettiah","Badaun","Badrinath Map","Balasore","Banaswara","Bankura","Ballia","Bardhaman","Baripada","Barrackpore","Barnala",
    "Barwani","Beed","Beawar","Bellary","Bhadohi","Bhadrak","Bharuch","Bhilai","Bhilwara","Bhiwani","Bidar","Bilaspur","Bangalore","Bhind",
    "Bhagalpur","Bharatpur","Bhavnagar","Bhopal","Bhubaneshwar","Bhuj","Bilimora","Bijapur","Bikaner","Bodh Gaya","Bokaro","Bundi","Barasat",
    "Bareilly","Basti","Bijnor","Burhanpur","Buxur","Calangute","Chandigarh","Chamba Map","Chandausi","Chandauli","Chandrapur","Chhapra",
    "Chidambaram","Chiplun","Chhindwara","Chitradurga","Chittoor","Cooch Behar","Chennai","Chittaurgarh","Churu","Coimbatore","Cuddapah",
    "Cuttack","Dahod","Dalhousie","Davangere","Dehri","Dewas","Dwarka","Dehradun","Delhi","Deoria","Dhanbad","Dharamshala Map","Dispur",
    "Dholpur","Diu Island Map","Durgapur","Didwana","Ernakulam","Etah","Etawah","Erode","Faridabad","Ferozpur","Faizabad","Gandhinagar",
    "Gangapur","Garia","Gaya","Ghaziabad","Godhra","Gokul","Gonda","Gorakhpur","Greater Mumbai","Gulbarga","Guna","Guntur","Gurgaon",
    "Greater Noida","Gulmarg","Hanumangarh","Haflong Map","Haldia","Haridwar","Hajipur","Haldwani","Hampi","Hapur","Hubli","Hardoi",
    "Hyderabad","Guwahati","Gangtok","Gwalior","Imphal","Indore","Itanagar","Itarsi","Jabalpur","Jagadhri","Jalna","Jamalpur","Jhajjar",
    "Jhalawar","Jaipur","Jaisalmer","Jalandhar","Jammu","Jamshedpur","Jhansi","Jaunpur","Jodhpur","Junagadh","Jalore","Kishanganj","Katihar",
    "Kanpur","Kangra Map","Kasauli","Kapurthala","Kanchipuram","Karnal","Karaikudi","Kanyakumari","Katni","Khajuraho","Khandala","Khandwa",
    "khargone","Kishangarh","Kochi","Kodaikanal","Kohima","Kolhapur","Kolkata","Kollam","Kota","Kottayam","Kovalam","Kozhikode","Kumbakonam",
    "Kumarakom","Kurukshetra","Lalitpur","Latur","Lucknow","Ludhiana","Lavasa","Leh","Laxmangarh","Madikeri","Madurai","Mahabaleshwar Map",
    "Mahabalipuram","Mahbubnagar","Manali","Mandu Fort Map","Mangalore","Malegaon","Manipal","Margoa","Mathura","Meerut","Mirzapur","Mohali",
    "Morena","Motihari","Moradabad","Mount Abu","Mumbai","Munger","Munnar","Mussoorie","Mysore","Muzaffarnagar","Mokokchung","Muktsar",
    "Nagpur","Nagaon","Nagercoil","Naharlagun","Naihati","Nainital","Nalgonda","Namakkal","Nanded","Narnaul","Nasik","Nathdwara",
    "Navsari","Neemuch","Noida","Ooty","Orchha","Palakkad","Palanpur","Pali","Palwal","Panaji","Panipat","Panvel","Pathanamthitta",
    "Pandharpur","Patna Sahib","Panchkula","Patna","Periyar","Phagwara","Pilibhit","Pinjaur","Pollachi","Pondicherry","Ponnani",
    "Porbandar","Port Blair","Porur","Pudukkottai","Punalur","Pune","Puri","Purnia","Pushkar","Patiala","Raxual","Rajkot","Rameswaram",
    "Rajahmundry","Ranchi","Ratlam","Raipur","Rewa","Rewari","Rishikesh","Rourkela","Sitamrahi","Sagar","Sangareddy","Saharanpur","Salem",
    "Salt Lake","Samastipur","Sambalpur","Sambhal","Sanchi","Sangli","Sarnath","Sasaram","Satara","Satna","Secunderabad","Sehore","Serampore",
    "Sangrur","Sirhind","Shillong","Shimla","Shirdi Map","ShivaGanga","Shivpuri","Silvassa","Singrauli","Sirsa","Sikar","Siwan","Somnath",
    "Sonipat","Sopore ","Srikakulam","Srirangapattna","Srinagar","Sultanpur","Surat","Surendranagar","Suri","Tawang","Tezpur","Thrippunithura",
    "Thrissur","Tiruchchirappalli","Tirumala","Tirunelveli","Thiruvannamalai","Tirur","Thalassery","Thanjavur","Thekkady","Theni",
    "Thiruvananthpuram Map","Thiruvannamalai Map","Tirupati","Trichy","Trippur","Tumkur","Tuni","Udaipur","Udhampur","Udupi","Ujjain",
    "Unnao","Ujjain Fort Map","Vidisha","Vadodra","Valsad","Vapi","Varanasi","Varkala","Vasco da Gama","Vellore","Vishakhapatnam","Vijayawada",
    "Vizianagaram","Vrindavan","Warangal","Washim","Yamunanagar","Yelahanka"]

    last_count=EmployeeCity.count(:employee_id)

    10000.times.each_with_index do |record |
      last_count=last_count+1
      if(employee_city_result.count==0)
        employee_city_result.push({:city_name=>city_name.sample,:employee_id=>last_count})
      else
        # end
        employee_city_result.push({:city_name=>city_name.sample,:employee_id=>last_count})
      end
    end

    EmployeeCity.bulk_insert do |worker|
      employee_city_result.each do |attrs|
        worker.add(attrs)
      end
    end
 end
end
