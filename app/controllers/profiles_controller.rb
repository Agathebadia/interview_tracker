class ProfilesController < ApplicationController


  def show
    @job_applications = find_applications
    if params[:status] == "Applied"
      @job_applications = JobApplication.where(status: "Applied")
    elsif params[:status] == "Interviewing"
      @job_applications = JobApplication.where(status: "Interviewing")
    elsif params[:status] == "Technical assignment"
      @job_applications = JobApplication.where(status: "Technical assignment")
    elsif params[:status] == "Management interview"
      @job_applications = JobApplication.where(status: "Management interview")
    elsif params[:status] == "Offer"
      @job_applications = JobApplication.where(status: "Offer")
    elsif params[:status] == "Hired"
      @job_applications = JobApplication.where(status: "Hired")
    elsif params[:status] == "Closed"
      @job_applications = JobApplication.where(status: "Closed")
    end
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
