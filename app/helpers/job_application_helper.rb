module JobApplicationHelper
  def toggle_favorite(job_application)
    if job_application.favorite
            link_to raw("<i class='fas fa-heart'></i>"), favorite_path(job_application), remote: true, method: :delete
    else
            link_to raw("<i class='far fa-heart'></i>"), favorites_path(id: job_application.id), remote: true, method: :post
    end
  end
end
