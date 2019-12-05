# in show is the Dashboard also could be romoved to job application
class ProfilesController < ApplicationController
  def show
    # @job_applications = JobApplication.left_outer_joins(:interviews).order("interviews.date ASC")
    # @job_applications = JobApplication.includes(:interviews).order("interviews.date ASC")
    @job_applications = current_user.job_applications
    @job_applications = @job_applications.status(status) if status
    @job_applications = @job_applications.favorites if favorite

    upcoming_range = Time.zone.now..(1.week.from_now)
    with_interviews = @job_applications.joins(:interviews)

    # @upcoming_interviews = upcoming_range.select(:id).distinct
    @hired = @job_applications.where("job_applications.status = 'Hired'")
    @upcoming_interviews = with_interviews.where("interviews.date < ? AND interviews.date > ?", 1.week.from_now, Time.now).uniq
    @with_interviews = with_interviews.where("interviews.date > ?", 1.week.from_now).where.not(id: @upcoming_interviews).uniq
    #@with_interviews.each do |job|
      #if upcoming_range.include?(job.interviews.order('date asc').first.date.to_date)
        #@upcoming_interviews
      #end
    #end

    # remove duplicates from upcoming job applications
    #@with_interviews.uniq

    #order interviews from job app by date and select closest one
    #@upcoming_interviews.interviews.order('date asc').first

    @no_interviews = @job_applications.left_outer_joins(:interviews).where(interviews: { job_application: nil })


    # (@job_applications.status["Hired"]).uniq

  end

  def new
    @profile = Profile.new
    #@first_name = first_name.new
    #@last_name = last_name.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    # @first_name = .new(interview_params)

    if @profile.save
      redirect_to show_profiles_path(current_user)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find_by(user_id: params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to show_profiles_path
  end

# Controller for the Dashboard

  private

  def favorite
    params.fetch :favorite, false
  end

  def status
    params.fetch :status, false
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
end
