class MessagesController < ApplicationController
  before_action :store_messages_instance

  def index; end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージが投稿されました。'
    else
      flash.now[:alert] = '空のメッセージです。'
      render :index
    end
  end

  private
  def message_params
    params[:user_id] = current_user.id
    params.permit(:body, :image, :group_id, :user_id)
  end

  def store_messages_instance
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @users = @group.users
    @messages = @group.messages
  end

end
