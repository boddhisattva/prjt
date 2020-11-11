require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:owner_id) }
    it do
      should define_enum_for(:status).with_values([:planned, :active, :done, :failed])
    end
  end
end
