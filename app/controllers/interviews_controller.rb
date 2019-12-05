class InterviewsController < ApplicationController
  def show
    @interview = Interview.find(params[:job_application_id])
  end

  def new
    @job_application = JobApplication.find(params[:job_application_id])
    @interview = Interview.new
  end

  def create
    @job_application = JobApplication.find(params[:job_application_id])
    @interview = Interview.new(interview_params)
    @interview.job_application = @job_application
    if @interview.save
      redirect_to job_application_path(@job_application)
    else
      render :new
    end
  end

  def edit
    @interview = Interview.find(params[:interview_id])
    @job_application = @interview.job_application
  end

  def update
    @interview = Interview.find(params[:id])
    @job_application = @interview.job_application
    @interview.update(interview_params)
    if @interview.save
      redirect_to show_profiles_path
    else
      render :edit
    end
  end
end

private

def interview_params
  params.require(:interview).permit(:date, :interviewer_name, :interviewer_email, :description)
end
