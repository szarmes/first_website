require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Uploads request" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:upload) {FactoryGirl.create(:uploads)}
  before do
    login_as(user)
  end

  describe "upload" do
    before { visit '/portfolio' }

    describe "with invalid information" do

      it "should not upload" do
        expect { click_button "Upload"}.not_to change(Uploads, :count)
      end
    end

    
    describe "with valid information" do

      before do
        fill_in 'uploads_title', with: "title"
        fill_in 'uploads_content', with: "content"
      end

      it "should upload" do
        expect { click_button "Upload" }.to change(Uploads, :count).by(1)
        
      end
    
    end
    describe "delete" do

      it "should delete upload" do
        expect { delete portfolio_path(upload) }.to change(Uploads, :count).by(1)
      end
    
    end
end
end