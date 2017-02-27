class GroupsController < ApplicationController

  def new
    @group = Group.new(params[:group])
  end

  def create
    binding.pry
    Group.create(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
