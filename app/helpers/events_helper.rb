module EventsHelper
  def current_user_attending? event_id
    current_user.attending_events.exists?(event_id)
  end
end
