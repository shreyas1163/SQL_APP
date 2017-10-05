module DifferenceFinder


  def self.folder_difference(folder1, folder2)
    difference_hash = {}
    folder1 = folder1.to_s + "/images/territories"
    folder2 = folder2.to_s + "/images/territories"
    folder1_exists = Dir.exists?(folder1)
    folder2_exists = Dir.exists?(folder2)
    if((folder1_exists) && (folder2_exists))
      folder1 = folder1.to_s + "/**/*"
      folder2 = folder2.to_s + "/**/*"
    folder1_files = Dir.glob(folder1)
    folder2_files = Dir.glob(folder2)
    img_type = ["png", "jpg", "jpeg"]
    folder1_img_files=[]
    folder2_img_files=[]
    folder1_files.each do |file|
      file_ext = file.split("/").last.to_s.split(".")[1]
      if(file_ext.present? && img_type.include?(file_ext))
        folder1_img_files.push(file)
      end
    end
    folder2_files.each do |file|
      file_ext = file.split("/").last.to_s.split(".")[1]
      if(file_ext.present? && img_type.include?(file_ext))
        folder2_img_files.push(file)
      end
    end
    folder1_img_files .each  do|file1|
      folder1_file_name=File.basename(file1,File.extname(file1))
      folder1_file_size = File.size(file1)
      folder2_img_files .each  do|file2|
        folder2_file_size = File.size(file2)
        folder2_file_name=File.basename(file2,File.extname(file2))
        folder2_file_extension = File.extname(file2)
        folder1_file_extension = File.extname(file1)
        file_extension=[]
        file_extension.push(folder2_file_extension,folder1_file_extension)
        if(folder1_file_name == folder2_file_name)
          size_difference = folder1_file_size.to_i - folder2_file_size.to_i
          if(size_difference != 0)
            difference_hash[folder1_file_name]={}
            difference_hash[folder1_file_name]["problem"]="file_size_difference"
            difference_hash[folder1_file_name]["size_difference"]= size_difference
          end
          if(folder1_file_extension != folder2_file_extension)
            if(difference_hash[folder1_file_name] == nil)
              difference_hash[folder1_file_name] = {}
              difference_hash[folder1_file_name]["problem"] = "file_extension"
            else
              difference_hash[folder1_file_name]["problem"]= "file_extension and file_size_difference"
            end
            difference_hash[folder1_file_name]["different_extension"]= file_extension
          end
        end
      end
    end
    difference_hash
    else
      puts "folder doesnt exist"
    end
  end
end
