class UsersController < ApplicationController

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end
end
