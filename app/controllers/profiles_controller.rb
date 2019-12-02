class ProfilesController < ApplicationController
  def show
    @job_applications = find_applications

  end

  private

  def find_applications
    if params.fetch(:favorite, false)
      current_user.job_applications.favorites
    else
      current_user.job_applications
    end
  end
end
