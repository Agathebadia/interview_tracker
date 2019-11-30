class FavoritesController < ApplicationController
  before_action :set_task, only: [:create, :destroy]

  def create
    @job_application.favorite!
  end

  def destroy
    @job_application.unfavorite!
  end

  private

  def set_task
    @job_application = JobApplication.find(params[:id])
  end
end
