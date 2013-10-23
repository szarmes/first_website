require 'spec_helper'

describe Uploads do
	
	before do
    	@uploads = Uploads.new(title: "Example Title", content: "this is a test")
	end	
   
    subject { @uploads }


  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should be_valid }


  describe "upload must have title" do
  	before { @uploads.title = " " }
    it { should_not be_valid }
  end


  describe "upload must have content" do
  	before { @uploads.content = " " }
    it { should_not be_valid }
  end



end