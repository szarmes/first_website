require 'spec_helper'

describe "Contact" do

  subject { page }

  describe "contact form" do
    before { visit contact_path }

    describe "with invalid information" do

      describe "incorrect input" do
        before { click_button "Send" }
        it { should have_content('Please fill all fields.') }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'message_name', with: "name"
        fill_in 'message_email', with: "test@test.com"
        fill_in 'message_subject', with: "subject"
        fill_in 'message_body', with: "body"
      end
      
      describe "flash success" do
        before { click_button "Send" }
        it { should have_content('Message was successfully sent.') }
      end
    
    end
  
  end

end