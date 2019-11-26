class ProfilesController < ApplicationController
  def show
    @user = User.find params[:id]
    @job_applications = JobApplication.where(user: current_user)
  end
end
