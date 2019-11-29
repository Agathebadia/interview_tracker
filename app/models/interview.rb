class Interview < ApplicationRecord
  belongs_to :job_application

  validates :date, presence: true
end
