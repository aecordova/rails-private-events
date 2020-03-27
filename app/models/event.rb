class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :event_attendances
  has_many :attendees, through: 'event_attendances', source: 'user'
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :date, presence: true
  validates :place, presence: true, length: { maximum: 150 }
  validates :organizer_id, presence: true

  scope :future, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }
end
