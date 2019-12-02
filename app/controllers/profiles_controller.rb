# in show is the Dashboard also could be romoved to job application
class ProfilesController < ApplicationController
 def new
    @profile = Profile.new
    #@first_name = first_name.new
    #@last_name = last_name.new

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
   # @first_name = .new(interview_params)

    if @profile.save!
      redirect_to profile_path(current_user)
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
    redirect_to profile_path(current_user)
  end









# Controller for the Dashboard
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

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
end
