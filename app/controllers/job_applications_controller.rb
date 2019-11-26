class JobApplicationsController < ApplicationController

  def new
    @job_application = JobApplication.new
    #authorize @application
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    #authorize @application

    @job_application.user_id = current_user.id
    if @application.save
      redirect_to :home #@application redirect to different page later
    else
      render :new #
    end
  end
  private

  def job_application_params
    params.require(:job_application).permit(:job_title, :company_name, :recruiter_name, :recruiter_email)
  end
end
