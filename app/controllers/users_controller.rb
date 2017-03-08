class UsersController < ApplicationController

  def index
    reg = params[:search_character]
    binding.pry
    @users = User.including_name_or_kana(reg)
    render 'search_results', formats: [:json], handlers: [:jbuilder]
  end
end
