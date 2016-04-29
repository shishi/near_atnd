require 'rails_helper'

RSpec.describe Atendee, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :event }
  end

  describe '.validates' do
    it { should validate_presence_of :status }

    it { should define_enum_for(:status).with([:attended, :absented]) }
  end
end
