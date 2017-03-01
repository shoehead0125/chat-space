class GroupsController < ApplicationController

  def new
    @group = Group.new
    current_id = current_user.id
    @users = User.where.not("id = #{current_id}")
  end

  def create
    @group = Group.new(group_params)
    params[:group][:user_ids] << current_user.id
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました。'
    else
      flash.now[:alert] = 'グループが作成されませんでした。'
      render new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました。'
    else
      flash.now[:alert] = 'グループが更新されませんでした'
      render edit_group_path(@group)
    end
  end

  private
  def group_params

    params.require(:group).permit(:name, {:user_ids => []})
  end

end
