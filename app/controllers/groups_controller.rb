class GroupsController < ApplicationController

  before_action :set_instance, only: [:edit, :update]

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました。'
    else
      @group = Group.new
      @users = User.all
      flash.now[:alert] = 'グループが作成されませんでした。'
      render :action => "new"
    end
  end

  def edit
    @users = User.all
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました。'
    else
      flash.now[:alert] = 'グループが更新されませんでした。'
      @group = Group.find(params[:id])
      @users = User.all
      render :action => "edit"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

  def set_instance
    @group = Group.find(params[:id])
  end

end
