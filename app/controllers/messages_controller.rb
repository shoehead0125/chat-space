class MessagesController < ApplicationController
  before_action :message_set_new, only: [:index, :create]

  def index
  end

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

  def message_set_new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @users = @group.users
    @messages = Message.where(group_id: @group.id)
  end

end
