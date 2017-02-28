class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    if Group.create(group_params)
      redirect_to root_path
    else
      redirect_to new_group_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
