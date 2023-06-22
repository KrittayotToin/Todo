class MessageController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def home
      @messages = Message.where(deleted: 0)
      @history_messages = Message.all
      puts @history_messages

  end


  def create
    new_message = params[:message]
    puts new_message


    @message = Message.create(message: new_message, deleted: 0)

    if @message.save
        render status: 200, json: { redirect_url: message_home_path , message: @message.to_json}
    else
      render status: 404, json: { error: "Failed to save message" }
    end


       # redirect_to message_home_path
  end


   def destroy
    @message = Message.find(params[:id])
    puts @message

    if @message.update(deleted: 1)
      render status: 200, json: { redirect_url: message_home_path ,message: "Message deleted successfully" }
    else
      render status: 404, json: { error: "Failed to delete message" }
    end
  end


 


end
