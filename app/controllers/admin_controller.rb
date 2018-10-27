class AdminController < ApplicationController

  def index
    @users = User.all
  end

  def users
    @users = User.all
  end

end
