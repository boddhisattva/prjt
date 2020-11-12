require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:owner_id) }
    it do
      should define_enum_for(:status).with_values(%i[planned active done failed]).with_prefix
    end

    context 'owner is manager validation' do
      context 'Project owner is not an employee with a manager role' do
        let(:project_record) do
          Project.new(name: 'new_project', owner_id: 'b82522f0-8644-4c65-a552-9c6b8a9e4b7a',
                      status: 'active')
        end

        it 'fails validation and returns an appropriate error message' do
          employee_service = double('employee_service')
          allow(EmployeeService).to receive(:new) { employee_service }
          allow(employee_service).to receive(:role).with(project_record.owner_id) { 'employee' }

          project_record.validate
          expect(project_record.errors.full_messages).to eq(['Owner is not manager This record is invalid'])
        end
      end

      context 'Project owner is an employee with a manager role' do
        let(:project_record) do
          Project.new(name: 'new_project', owner_id: 'f3e868b9-6151-49c4-8d51-b9e3fb9255ba',
                      status: 'active')
        end

        it 'returns true' do
          employee_service = double('employee_service')
          allow(EmployeeService).to receive(:new) { employee_service }
          allow(employee_service).to receive(:role).with(project_record.owner_id) { 'manager' }

          expect(project_record.validate).to be true
        end
      end
    end
  end
end
