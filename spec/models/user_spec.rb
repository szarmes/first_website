require 'spec_helper'

describe User do
	
	before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobarfoobar", password_confirmation: "foobarfoobar", admin: true)
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:admin) }
  it { should be_valid }

  describe "checking if admin " do
  	  it { should be_admin }
  end

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
   describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end
   describe "when password_confirmation is not present" do
    before { @user.password_confirmation = " " }
    it { should_not be_valid }
  end
  describe "when admin is not present" do
    before { @user.admin = nil }
    it { should_not be_valid }
  end
   describe "when email is not formatted correctly" do
    before { @user.email = "rodney " }
    it { should_not be_valid }
  end
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
   describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "foobarfooba" }
    it { should_not be_valid }
  end



end