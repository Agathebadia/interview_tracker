class ProfilesController < ApplicationController

  def show
    # @job_applications = JobApplication.left_outer_joins(:interviews).order("interviews.date ASC")
    # @job_applications = JobApplication.includes(:interviews).order("interviews.date ASC")
    @job_applications = current_user.job_applications
    @job_applications = @job_applications.status(status) if status
    @job_applications = @job_applications.favorites if favorite

    upcoming_range = Time.zone.now..(1.week.from_now)
    with_interviews = @job_applications.joins(:interviews)
    @upcoming_interviews = with_interviews.where("interviews.date" => upcoming_range)
    @with_interviews = with_interviews.where("interviews.date > ?", 1.week.from_now).where.not(id: @upcoming_interviews)

    @no_interviews = @job_applications.left_outer_joins(:interviews).where(interviews: { job_application: nil })
  end

  private

  def favorite
    params.fetch :favorite, false
  end

  def status
    params.fetch :status, false
  end
end
