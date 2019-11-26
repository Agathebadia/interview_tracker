class JobApplicationsController < ApplicationController

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def new
    @job_application = JobApplication.new
  end


  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.user_id = current_user.id
    if @job_application.save
      redirect_to @job_application
    else
      render :new
    end
  end

  def edit
    @job_application = JobApplication.find(params[:id])
  end

  def update
    @job_application = JobApplication.find(params[:id])
    @job_application.update(job_application_params)
    if @job_application.save!
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:job_title, :company_name, :recruiter_name, :recruiter_email, :favorites)
  end
end
