class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
		@events = User.find(params[:id]).events
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: params[:location], password: params[:password])
		redirect_to "/users/#{@user.id}"
	end

	def create
		@user = User.create(first_name: params[:first_name], last_name: params[:last_name], location: params[:location], email: params[:email], password: params[:password])

		if @user.save
			session[:user_id]=@user.id
			session[:first_name]=@user.first_name
			session[:last_name]=@user.last_name
			redirect_to "/events"
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to "/"
		end
	end



end
