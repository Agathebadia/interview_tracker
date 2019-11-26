class ProfilesController < ApplicationController
  def show
    @user = current_user
    @applications = Application.where(user: current_user)
  end
end
