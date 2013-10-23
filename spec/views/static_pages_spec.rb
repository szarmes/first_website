require 'spec_helper'

describe "static_pages"do
	
	describe "homepage test" do
		it "should have content Duncan" do 
			visit root_path
			expect(page).to have_content('Duncan Szarmes')
			expect(page).to_not have_content('Duncan Szarmes sucks')
		end
			it "should have correct title" do
			visit root_path
	  		expect(page).to have_title("Duncan | Home")
  		end
	end
	
	describe "references test" do
		it "should have content References" do 
			visit references_path
			expect(page).to have_content('References')
			expect(page).to_not have_content('Duncan Szarmes sucks')
		end
			it "should have correct title" do
			visit references_path
	  		expect(page).to have_title("Duncan | References")
  		end
	end
	
	describe "resume test" do
		it "should have content Resume" do 
			visit resume_path
			expect(page).to have_content('Resume')
			expect(page).to_not have_content('Duncan Szarmes sucks')
		end
			it "should have correct title" do
			visit resume_path
	  		expect(page).to have_title("Duncan | Resume")
  		end
	end


end