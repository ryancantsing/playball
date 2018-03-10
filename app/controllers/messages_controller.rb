class MessagesController < ApplicationController
  def create
    sender_id = session[:user_id]
    recipient_id = params['message'][:recipient_id]
    message = Message.create(sender_id: sender_id, recipient_id: recipient_id, content: params['message'][:content])
    redirect_to '/messages/view'
  end

  def new
    @player = Player.find(params[:id])
    render 'new'
  end

  def view
    user_id = session[:user_id]
    @sent_messages = Message.where(sender_id: user_id)
    @received_messages = Message.where(recipient_id: user_id)
    render 'view'
  end

  def delete
    message = Message.find(params[:id])
    message.delete()
    redirect_to '/messages/view'
  end
end
