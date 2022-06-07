class UsersController < ApplicationController
  def show
    @user = current_user.id
  end

  def update
    @user = current_user
  end

  def edit
    @user = current_user
  end
end
