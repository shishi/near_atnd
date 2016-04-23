require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validates" do
    it { should validate_presence_of :uid }
    it { should validate_presence_of :name }
    it { should validate_presence_of :nickname }
    it { should validate_presence_of :image }
    it { should validate_presence_of :token }
    it { should validate_presence_of :secret }

    it { should validate_numericality_of(:uid).only_integer }
  end
end
