class GroupsController < ApplicationController

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました。'
    else
      redirect_to new_group_path, alert: 'グループが作成されませんでした。'
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users = User.all
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました。'
    else
      redirect_to edit_group_path(@group), alert: 'グループが更新されませんでした。'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

end
