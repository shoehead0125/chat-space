class MessagesController < ApplicationController
  before_action :store_messages_instance

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージが投稿されました。'
    else
      flash.now[:alert] = @message.errors.full_messages.first
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def store_messages_instance
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

end
