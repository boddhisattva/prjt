class OwnerIsManagerValidator < ActiveModel::Validator
  MANAGER_ROLE = 'manager'.freeze

  def validate(record)
    if EmployeeService.new.role(record.owner_id) != MANAGER_ROLE
      record.errors.add(:owner_is_not_manager, "This record is invalid")
    end
  end
end
