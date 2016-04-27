require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#validates' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :hold_at }
    it { should validate_presence_of :capacity }
    it { should validate_presence_of :location }
    it { should validate_presence_of :owner }
    it { should validate_presence_of :description }

    it { should validate_length_of(:title).is_at_most 255 }
    it { should validate_length_of(:location).is_at_most 255 }
    it { should validate_length_of(:owner).is_at_most 255 }

    it { should validate_numericality_of(:capacity).only_integer }
  end
end
