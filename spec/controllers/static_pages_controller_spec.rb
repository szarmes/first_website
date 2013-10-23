require 'spec_helper'

describe StaticPagesController do
  
  describe "load pages" do

    it "should render home page" do
      get :home
      response.should render_template :home
    end

    it "should render resume page" do
      get :resume
      response.should render_template :resume
    end

    it "should render references page" do
      get :references
      response.should render_template :references
   
    end
  
  end

end