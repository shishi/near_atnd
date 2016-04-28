class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_twitter(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to events_url
  end

  def destroy
    reset_session
    # TODO: fix redirect link
    redirect_to events_url
  end

  def failure
    flash[:alert] = 'login failure'
    # TODO: fix redirect link
    redirect_to events_url
  end
end
