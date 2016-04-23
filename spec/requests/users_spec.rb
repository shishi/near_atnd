require "rails_helper"

RSpec.describe User, type: :request do
  let!(:user){ create :user }

  before do
    get users_show_path id: user.id
  end

  it { should render_template :show }

  # expect(response).to render_template(:new)

  # post "/widgets", :widget => {:name => "My Widget"}

  # expect(response).to redirect_to(assigns(:widget))
  # follow_redirect!

  # expect(response).to render_template(:show)
  # expect(response.body).to include("Widget was successfully created.")
end
