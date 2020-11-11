class Project < ApplicationRecord
  enum status: %i(planned active done failed)

  validates :name, presence: true, uniqueness: true
  validates :owner_id, presence: true
  validates :status, inclusion: { in: %i(planned active done failed) }
end
