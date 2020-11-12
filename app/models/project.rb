class Project < ApplicationRecord
  enum status: %i(planned active done failed), _prefix: true

  validates :name, presence: true, uniqueness: true
  validates :owner_id, presence: true
  validates :status, inclusion: { in: statuses.keys }
  validates_with OwnerIsManagerValidator
end
