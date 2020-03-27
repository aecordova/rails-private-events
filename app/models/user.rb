class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'organizer_id'
  has_many :event_attendances
  has_many :attending_events, through: 'event_attendances', source: 'event'

  validates :name, presence: true, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
