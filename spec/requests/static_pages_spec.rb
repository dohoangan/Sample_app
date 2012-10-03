require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "Home Page" do
		


		before { visit root_path }
		it { should have_selector('h1', 		:text => 'Welcome to the Sample App') }
		it { should have_selector('title', 	
											:text => "Ruby On Rails Sample App") }
		it { should_not have_selector('title', :text => '| Home')}
		describe "should have the right links on the layout" do
			before {click_link "Help"}
			it {should have_selector('title', 
																text: 'Ruby On Rails Sample App | Help')}
		end

		describe "should should have the sign in selector" do
			before { click_link "Sign in" }
			it { should have_selector('title', text: "Sign in") }	
		end

		describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
			end
      
      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
			end 
			describe "follower/following counts" do
				let(:other_user) { FactoryGirl.create(:user) }
				before do
					other_user.follow!(user)
					visit root_path
				end

				it { should have_link("0 following", 	href: following_user_path(user)) }
				it { should have_link("1 follower", 	href: followers_user_path(user)) }
			end


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

