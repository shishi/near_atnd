require "rails_helper"

RSpec.describe '/users', type: :feature do
  let(:user){ create :user }
  before do
    visit user_path id: user.id
  end

  describe '/user/:id' do
    it { page.should have_content user.name }
    it { page.should have_content user.nickname }
    it { page.should have_content user.description }
    it { page.should have_selector("img[src$='#{user.image}']") }
  end
end
