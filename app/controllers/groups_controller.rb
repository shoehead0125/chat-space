class GroupsController < ApplicationController

  def new
    @group = Group.new(params[:group])
  end

  def create
    Group.create(group_params)
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
