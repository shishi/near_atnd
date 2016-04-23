class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_twitter(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to user_url id: user.id
  end

  def destroy
    reset_session
    # TODO: fix redirect link
    redirect_to user_url id: User.first.id
  end

  def failure
    flash[:alert] = 'login failure'
    # TODO: fix redirect link
    redirect_to user_url id: User.first.id
  end
end
