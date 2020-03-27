class EventAttendancesController < ApplicationController
  def create
    @attendance = current_user.event_attendances.build(event_id: params[:id])
    puts "event_id: " + params[:id]
    puts "Attendance valid?: " + @attendance.valid?.to_s
    puts "Errors: " + @attendance.errors.full_messages.to_s
    if @attendance.save
      redirect_to event_path(id: @attendance.event_id)
      flash[:success] = "Successfully registered to event "  
    end
  end
end
