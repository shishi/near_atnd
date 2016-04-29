class AtendeesController < ApplicationController
  before_action :login_required, only: [:atend, :absent]
  before_action :set_event, only: [:atend, :absent]
  before_action :set_atendee_params, only: [:atend, :absent]

  def atend
    atendee = Atendee.find_or_create_by @atendee_params
    case atendee.status
    when 'attended'
      flash[:notice] = 'Already atended'
    when 'absented'
      flash[:alert] = 'Error something' unless atendee.update(status: 'attended')
    else
      atendee = Atendee.new @atendee_params.merge(status: 'attended')
      flash[:alert] = 'Error something' unless atendee.save
    end

    redirect_to event_path @event
  end

  def absent
    atendee = Atendee.find_by @atendee_params
    flash[:alert] = 'Error something' unless atendee.update(status: 'absented')

    redirect_to event_path @event
  end

  private

  def set_event
    @event = Event.find params[:id]
  end

  def set_atendee_params
    @atendee_params = { user_id: current_user.id, event_id: @event.id }
  end
end
