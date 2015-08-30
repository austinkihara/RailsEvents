class JoinsController < ApplicationController

	def create
		@join = Join.create(user_id: params[:user_id], event_id: params[:event_id])
		@join.save
		redirect_to "/events"
	end

	def destroy
		join = Join.find(params[:id])
		join.destroy
		redirect_to "/events"
	end

end

