class JobApplicationsController < ApplicationController

  def new
    @job_application = JobApplication.new
    #authorize @application
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    #authorize @application

    @job_application.user_id = current_user.id
    if @job_application.save
      redirect_to root_url # later job_application_path
    else
      render :new #
    end
  end
  private

  def job_application_params
    params.require(:job_application).permit(:job_title, :company_name, :recruiter_name, :recruiter_email)
  end
end
