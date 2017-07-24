class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    sent_messages = Message.where(user_id: current_user.id, recipient_id: @user)
    received_messages = Message.where(user_id:  @user, recipient_id: current_user.id)
    @messages = sent_messages + received_messages
  end
end
