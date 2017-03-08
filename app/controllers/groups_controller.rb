class GroupsController < ApplicationController

  before_action :set_group_update, only: [:edit, :update]
  before_action :set_group_new, only: [:new, :create]

  def new; end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました。'
    else
      flash.now[:alert] = 'グループが作成されませんでした。'
      render action: :new
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました。'
    else
      flash.now[:alert] = 'グループが更新されませんでした。'
      render action: :edit
    end
  end
  
  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

  def set_group_new
    @group = Group.new
    @users = User.all
  end

  def set_group_update
    @group = Group.find(params[:id])
    @users = User.all
  end

end
