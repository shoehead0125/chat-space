class UsersController < ApplicationController

  def index
    reg = params[:search_character]
    @users = User.where("name like '#{reg}'").or(User.where("kana like '#{reg}'"))
    render 'search_results', formats: [:json], handlers: [:jbuilder]
  end
end
