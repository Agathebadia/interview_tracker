class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy

  validates :favorites, default: false

  validates :job_title, presence: true
  validates :company_name, presence: true
  validates :recruiter_email, presence: true

end
