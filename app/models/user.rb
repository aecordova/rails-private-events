class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'organizer_id'
  has_many :event_attendances
  has_many :attending_events, through: 'event_attendances', source: 'event'
end
