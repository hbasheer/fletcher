require 'spec_helper'

describe Fletcher, :vcr do
  describe :models do 
    it "should return an array of symbols" do
     models = described_class.models
     models.is_a?(Array).should == true
    end
  end

  context :models do 
    describe :identify_model, :vcr do
      it "should raise an error when using an unsupported domain" do 
        lambda{described_class.identify_model(Factory(:invalid).url)}.should raise_error 
      end

      for model in Fletcher.models
        it "should return #{model} sym when using a #{model} domain" do
          described_class.identify_model(Factory(model).url).should == model
        end 
      end   
    end 

    describe :fetch, :vcr do
      # for model in Fletcher.models
      #   it "should return valid data for #{model} model" do
      #     item = described_class.fetch(Factory(model).url)
      #     item.should_not be_nil
      #     item.name.should_not be_nil       
      #     item.description.should_not be_nil if model == :amazon
      #   end 
      # end   
    end    
  end
  
  describe :version do
    it "should return a string" do
      described_class.version.should_not be_nil
    end
  end
end  
