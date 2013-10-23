require 'spec_helper'
describe Message do
	
	before do
    	@message = Message.new(name: "Example Name", email: "test@example.com", 
    		subject: "test", body:"this is the body")
	end	
   
    subject { @message }
	
	it { should respond_to(:name) }
  	it { should respond_to(:email) }
  	it { should respond_to(:subject) }
  	it { should respond_to(:body) }
  	it { should be_valid }

	describe "when name is not present" do
	    before { @message.name = " " }
	    it { should_not be_valid }
	end
	describe "when email is not present" do
	    before { @message.email = " " }
	    it { should_not be_valid }
	end
	describe "when email is not formatted correctly" do
	    before { @message.email = "rodney " }
	    it { should_not be_valid }
	end
	describe "when subject is not present" do
	    before { @message.subject = " " }
	    it { should_not be_valid }
	end
	describe "when body is not present" do
	    before { @message.body = " " }
	    it { should_not be_valid }
	end
 	
	describe "it should respond to params" do
		it "checks name" do
		@message.name.should eql "Example Name"
		end
		it "checks email" do
		@message.email.should eql "test@example.com"
		end
		it "checks subject" do
		@message.subject.should eql "test"
		end
		it "checks body" do
		@message.body.should eql "this is the body"
		end
	end	



end