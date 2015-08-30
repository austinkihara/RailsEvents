class EventsController < ApplicationController

	def index
		@user = User.find(session[:user_id])
		@events = Event.all
		@joins = Join.all
	end

	def create
		@event = Event.create(user_id: params[:user_id], name: params[:name], location: params[:location], date: params[:date])
		@event.save
		redirect_to "/events"
	end

	def show
		@event = Event.find(params[:id])
		@names_joined = Event.find(params[:id]).joins
		@comments = Event.find(params[:id]).comments
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to "/events"
	end
end
