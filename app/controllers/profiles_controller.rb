class ProfilesController < ApplicationController
  def show
    @user = current_user
    @job_applications = JobApplication.where(user: current_user)
  end
end
