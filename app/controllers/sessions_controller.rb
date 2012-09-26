class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			flash[:success] = "You are successfully signed in!"
			redirect_to user
		else
			flash.now[:error] = "Invalid Email/Password in combination"
			render 'new'
		end
	end

	def destroy
		sign_out
    redirect_to root_path
	end
end
