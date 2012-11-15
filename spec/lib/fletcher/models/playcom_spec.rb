require 'spec_helper'

describe Fletcher, :vcr do
  describe :fetch, :vcr do
    it "should fetch playcom product" do
      item = described_class.fetch(FactoryGirl.build(:playcom).url)
      item.should_not be_nil
      item.name.should_not be_nil       
      item.description.should_not be_nil 
    end     
  end 
end 

describe Fletcher::Model::Playcom, :vcr do
  describe "parse" do     
    context "with valid data" do
      it "should return correct model info" do 
        model = described_class.new
        model.parse Fletcher::Data.read(FactoryGirl.build(:playcom).url)
        model.doc = nil
        model.name.should_not be_nil
        model.description.should_not be_nil
        model.price.should_not be_nil        
        model.image.should_not be_nil        
      end       
    end
  end
end  