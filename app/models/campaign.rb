class Campaign < ApplicationRecord
  STATUSES = %w|pending processing completed|

  has_many :recipients

  validates :title, presence: true
  validates :status, presence: true, inclusion: {in: STATUSES}
end
