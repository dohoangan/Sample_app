require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "Home Page" do
		before { visit root_path }
		it { should have_selector('h1', 		:text => 'Welcome to the Sample App') }
		it { should have_selector('title', 	
											:text => "Ruby On Rails Sample App") }
		it { should_not have_selector('title', :text => '| Home')}
		it "should have the right links on the layout" do
			click_link "Help"
			page.should have_selector('title', 
													text: 'Ruby On Rails Sample App | Help')
		end


	end

	describe "Help Page" do
		before { visit help_path }
		it {should have_selector('h1', text: 'Help Page')}
		it { should have_selector('title', 
													text: 'Ruby On Rails Sample App | Help') }	
	end

	describe "About Us" do
		before { visit about_path }
		it { should have_selector('h1', :text => 'About Us') }
		it { should have_selector('title', 
													:text => 'Ruby On Rails Sample App | About us') }
	end

	describe "Contact Us" do
		before { visit contact_path }
		it { should have_selector('h1', :text => 'Contact Us') }
		it { should have_selector('title', 
													:text => 'Ruby On Rails Sample App | Contact us') }
	end

end

