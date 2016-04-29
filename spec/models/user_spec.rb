require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :events }
    it { should have_many :atendees }
  end

  describe '.validates' do
    it { should validate_presence_of :uid }
    it { should validate_presence_of :name }
    it { should validate_presence_of :nickname }
    it { should validate_presence_of :image }
    it { should validate_presence_of :token }
    it { should validate_presence_of :secret }

    it { should validate_length_of(:name).is_at_most 255 }
    it { should validate_length_of(:nickname).is_at_most 255 }

    it { should validate_numericality_of(:uid).only_integer }
  end

  describe '#find_or_create_from_twitter' do
    context 'find' do
      let(:user) { create :user }
      let(:omniauth) do
        {
          provider: 'twitter',
          uid: user.uid,
          info: {
            name: user.name,
            nickname: user.nickname,
            image: user.image,
            description: user.description
          },
          credentials: {
            token: user.token,
            secret: user.secret
          }
        }
      end

      it 'should be same user' do
        User.find_or_create_from_twitter(omniauth).should eq user
      end
    end

    context 'create' do
      let(:user) { build :user }
      let(:omniauth) do
        {
          provider: 'twitter',
          uid: user.uid,
          info: {
            name: user.name,
            nickname: user.nickname,
            image: user.image,
            description: user.description
          },
          credentials: {
            token: user.token,
            secret: user.secret
          }
        }
      end

      it 'should have same uid' do
        User.find_or_create_from_twitter(omniauth).uid.should eq user.uid
      end
    end
  end
end
