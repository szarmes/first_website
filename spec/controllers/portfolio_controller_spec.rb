require 'spec_helper'

describe PortfolioController do

let(:testUser) { FactoryGirl.create(:user) }
let(:testUpload) { FactoryGirl.create(:uploads) }

describe "GET index" do
 	it "loads the index page" do
    	get :index
    	response.should render_template :index
	end

	it "loads all of the uploads into @items" do
      get :index
      assigns(:items).should include(testUpload)
    end

    describe "admin not signed in" do

      it "is unable to create upload" do
        get 'create'
        response.should redirect_to root_path
      end
    end
end

describe "POST create" do
	describe "when admin signed in" do

		before do
			sign_in testUser
		end

		it "should be able to create upload" do
			post 'create', :uploads => {"title" => "title", "content" => "content"}
        	response.should redirect_to '/portfolio'
        	flash[:success].should_not be_nil
        	flash[:error].should be_nil
        end

        it "should not be able to create invalid upload" do
        	post 'create', :uploads => {"title" => "", "content" => ""}
        	response.should redirect_to '/portfolio'
        	flash[:error].should_not be_nil
        	flash[:success].should be_nil

        end

        it "should be able to destroy upload" do
        	delete :destroy, id: testUpload
        	response.should redirect_to '/portfolio'
        	flash[:success].should_not be_nil
        end
	end
end
end