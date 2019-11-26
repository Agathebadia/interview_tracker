class JobApplicationsController < ApplicationController
  #def index
    #@applications = policy_scope(Applications.all)
    #@tools = policy_scope(Tool.all)
  #end

  #def show
    #@application = Application.find(params[:id])
    #@tool = Tool.find(params[:id])
    #authorize @application
  #end

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

#application1=JobApplication.new(job_title:'Fullstack Developer', company_name:'Le Wagon', recruiter_name:'Mr. XXX',recruiter_email:'xxx@lewagon.com')
#tool1.save!
#puts "Created #{User.count} and #{Tool.count}"


#JobApplication.new(job_title:'Fullstack Developer', company_name:'Le Wagon', recruiter_name:'Mr. XXX',recruiter_email:'xxx@lewagon.com')
