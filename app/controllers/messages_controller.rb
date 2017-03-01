class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @users = @group.users
    @user  = current_user
  end

end
