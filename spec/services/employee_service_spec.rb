require 'rails_helper'

describe EmployeeService do
  describe '#role' do
    context 'given a valid employee id', vcr: { cassette_name: 'employee_role_for_valid_emp_id' } do
      let(:valid_emp_id) { '3f949e89-4d40-48fb-b43c-da20e7c768aa' }

      it 'returns the employee role' do
        employee_role = EmployeeService.new.role(valid_emp_id)

        expect(employee_role).to eq('employee')
      end
    end

    context 'given an invalid employee id', vcr: { cassette_name: 'employee_role_for_invalid_emp_id' } do
      let(:invalid_emp_id) { 'random_emp_id' }

      it 'returns nil' do
        employee_role = EmployeeService.new.role(invalid_emp_id)

        expect(employee_role).to be_nil
      end
    end
  end
end
