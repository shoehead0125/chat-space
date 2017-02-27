class GroupsController < ApplicationController

  def new
  end

  def create
    Group.create(group_params)
  end

  private
  def group_params
    params.permit(:string, :name)
  end

end
