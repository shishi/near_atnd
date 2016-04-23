module LoginHelper
  def login!(user)
#    visit user_path id: user.id
    page.set_rack_session user_id: user.id
  end
end
