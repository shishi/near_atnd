module EventsHelper
  def already_atended?
    !!Atendee.find_by(event_id: params[:id], user_id: current_user.id, status: 'attended')
  end
end
