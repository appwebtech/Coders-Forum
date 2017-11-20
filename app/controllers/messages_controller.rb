class MessagesController < ApplicationController
	before_action :mugabe_went, only: [:show, :edit, :update, :destroy]

	def index 
		@messages = Message.all.order("created_at DESC")
	end

	def show
	end

	def new
		@message = current_user.messages.build
	end

	def create
		@message = current_user.messages.build(josembi)

		if @message.save
	#		flash[:success] = "Message saved Successfully"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @message.update(josembi)
	#		flash[:success] = "Message successfully updated!"
			redirect_to message_path 
		else
			render 'edit'
		end
	end

	def destroy
		@message.destroy
	#	flash[:danger] = "Message successfully destroyed"
		redirect_to root_path
	end

	private

	def mugabe_went
		@message = Message.find(params[:id])
	end

	def josembi
		params.require(:message).permit(:title, :description)
	end
end
