require 'spec_helper'

describe "static_pages"do
	describe "homepage test" do
		it "should have content Duncan" do 
			visit root_path
			expect(page).to have_content('Duncan Szarmes')
			expect(page).to_not have_content('Duncan Szarmes sucks')
		end
		it "should have title correct" do
		visit root_path
  		expect(page).to have_title("Duncan | Home")
  		end
	end


end