class MessagesController < ApplicationController
  before_action :store_messages_instance

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'メッセージが投稿されました。' }
        format.json { render "message_index.json.jbuilder" }
      end
    else
      flash.now[:alert] = @message.errors.full_messages.first
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def store_messages_instance
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

end
