class Job < ApplicationRecord
  validates :job_title, presence: true
end
