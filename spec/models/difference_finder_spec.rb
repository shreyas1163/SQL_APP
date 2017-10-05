require 'rails_helper'
# require 'models/modules/difference_finder.rb'

RSpec.describe DifferenceFinder, :type => :model do

  describe ".folder_difference" do
    context "given 2 folders path " do
      it "returns hash " do
        expect(DifferenceFinder.folder_difference("/home/rshreyas/shreyas/folder_2_1679098","/home/rshreyas/shreyas/SZ_ST5_Mailings_1679098")).to include("7","6")
      end
    end
  end

  describe ".folder_difference" do
    context "given 2 folders path " do
      it "returns hash " do
        expect(DifferenceFinder.folder_difference("/home/rshreyas/shreyas/folder_2_1679098","/home/rshreyas/shreyas/SZ_ST5_Mailings_1679098")).not_to include("1","4")
      end
    end
  end

  describe ".folder_difference" do
    context "given 2 folders path " do
      it "returns hash " do
        expect(DifferenceFinder.folder_difference("/home/rshreyas/shreyas","/home/rshreyas/shreyas/SZ_ST5_Mailings_167909821")).to eq(nil)
      end
    end
  end

  describe ".folder_difference" do
    context "given 2 folders path " do
      it "returns hash " do
        expect(DifferenceFinder.folder_difference("/home/rshreyas/shreyas","/home/rshreyas/shreyas/")).to eq(nil)
      end
    end
  end
end
