require 'spec_helper'

describe "Static pages" do

	describe "Home Page" do
		it "should have the content 'Sample App'" do
			visit '/static_pages/home'
			page.should have_selector('h1', 		:text => 'Sample App')
			page.should have_selector('title', 	
											:text => "Ruby On Rails Sample App")
		end
	end

	describe "Help Page" do
		it "should have the content 'Help Page'" do
			visit '/static_pages/help'
			page.should have_selector('h1', text: 'Help Page')
			page.should have_selector('title', 
											text: 'Ruby On Rails Sample App | Help')
		end		
	end

	describe "About Us" do
		it "should have the content 'About Page'" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'About Us')
			page.should have_selector('title', 
											:text => 'Ruby On Rails Sample App | About us')
		end
	end

end

