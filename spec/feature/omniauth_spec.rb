require "rails_helper"

RSpec.describe '/auth', type: :feature do
  describe '/auth/twitter' do
    let(:user){ create :user }

    context 'success' do
      before do
        OmniAuth.config.mock_auth[:twitter] =
          OmniAuth::AuthHash.new({
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
                                 })
        visit user_path id: user.id
        click_link 'log-in with Twitter'
      end
      # TODO: should redirect previous path
      # it { current_path.should eq user_path id: user.id }
      it { page.should have_content "login as #{user.name}" }
      it { page.should_not have_content 'login failure' }
    end

    context 'failure'do
      before do
        OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
        visit user_path id: user.id
        click_link 'log-in with Twitter'
      end

      # TODO: should rediret index
      # it { current_path.should eq user_path id: user.id }
      it { page.should have_content 'login failure' }
    end
  end

  describe 'layout' do
    context 'not logged-in' do
      let(:user){ create :user }

      before do
        visit user_path id: user.id
      end

      it { current_path.should eq user_path id: user.id }
      it { page.should have_content 'log-in with Twitter' }
      it { page.should_not have_content 'log-out' }
    end

    context 'logged-in' do
      let(:user){ create :user }

      before do
        login! user
        visit user_path id: user.id
      end

      it { current_path.should eq user_path id: user.id }
      it { page.should have_content 'log-out' }
      it { page.should_not have_content 'log-in with Twitter' }

      context 'exec log-out' do
        before do
          click_link 'log-out'
        end

        # TODO: fix test according production code
        # it { current_path.should eq hogehoge_path }
        it { page.should have_content 'log-in with Twitter' }
        it { page.should_not have_content 'log-out' }
      end
    end
  end
end
