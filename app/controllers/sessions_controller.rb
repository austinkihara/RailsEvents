class SessionsController < ApplicationController

	def index

	end
	

	def create
		@user = User.find_by(email: params[:email])

		if @user && @user.authenticate(params[:password])
			session[:user_id]=@user.id
			session[:first_name]=@user.first_name
			session[:last_name]=@user.last_name
			redirect_to "/events"
		else
			flash[:errors] = "Invalid Login"
			redirect_to "/"
		end
	end

	def destroy
		reset_session
		redirect_to "/"
	end

end
