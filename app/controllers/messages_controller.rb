class MessagesController < ApplicationController
  def create
    sender_id = session[:user_id]
    recipient_id = params['message'][:recipient_id]
    message = Message.create(sender_id: sender_id, recipient_id: recipient_id, subject: params['message'][:subject], content: params['message'][:content])
    redirect_to '/messages/view'
  end

  def new
    @user = User.find(params[:id])
    render 'new'
  end

  def read
    message = Message.find(params[:id])
    message.read = true
    message.update(read: message.read)
    redirect_to '/messages/view'
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
