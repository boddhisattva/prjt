require "rails_helper"

class Validatable
  include ActiveModel::Validations
  validates_with OwnerIsManagerValidator
  attr_accessor  :owner_id
end

RSpec.describe OwnerIsManagerValidator do
  subject { Validatable.new }

  before do
    @employee_service = double('employee_service')
    allow(EmployeeService).to receive(:new) { @employee_service }
  end

  describe '#validate' do
    context "Owner is not a manager" do
      it "raises appropriate error" do
        allow(@employee_service).to receive(:role).with(subject.owner_id) { 'employee' }

        subject.validate
        expect(subject.errors.full_messages).to eq(["Owner is not manager This record is invalid"])
      end
    end

    context "Owner is a manager" do
      it "returns true" do
        allow(@employee_service).to receive(:role).with(subject.owner_id) { 'manager' }

        expect(subject.validate).to be true
      end
    end
  end
end
