class Guest < ApplicationRecord
  has_many :hosted_events, class_name: "Event", foreign_key: "host_id"
  has_and_belongs_to_many :events

  def rsvp(event)
    events << event
  end

end
