class EventAttendancesController < ApplicationController
  def create
    id = params[:id]
    if current_user_attending?(id)
      flash.now[:notice] = "You have already registered to that event"
      redirect_back fallback_location: events_url
    else
      @attendance = current_user.event_attendances.build(event_id: id)
      if @attendance.save
        flash[:success] = 'Successfully registered to event'
        redirect_to event_path(id: id)
      else
        flash[:error] = 'Unable to register you to the event'
        redirect_back fallback_location: events_url
      end
    end
  end
end
