class FavoritesController < ApplicationController
  def toggle_favorite
    @job_application = JobApplication.find(params[:job_application_id])
    @job_application.toggle_favorite!
  end
end
