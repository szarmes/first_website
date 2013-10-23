require 'spec_helper'

describe ContactController do
  
  describe "GET new" do
    it "load contact form" do
      get :new
      response.should render_template :new
    end
 
  end

  describe "POST create" do
    it "can fill in fields and send message" do
      post 'create', :message => { "name" => "name", "email" => "test@test.com",
                                   "subject" => "subject", "body" => "body" }
      response.should redirect_to root_path
      flash[:notice].should_not be_nil
      flash.now[:alert].should be_nil
    end

    it "shouldn't respond to invalid input" do
      post 'create', :message => { "name" => "" }
      response.should render_template :new
      flash.now[:alert].should_not be_nil
      flash.now[:notice].should be_nil
    end
  
  end


end