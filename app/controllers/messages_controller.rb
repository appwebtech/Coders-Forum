class MessagesController < ApplicationController
	def index 
		@messages = Message.all.order("created_at DESC")
	end

	def show
		@message = Message.find(params[:id])
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(josembi)

		if @message.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		
	end

	def destroy
		
	end

	private

	def josembi
		params.require(:message).permit(:title, :description)
	end
end
