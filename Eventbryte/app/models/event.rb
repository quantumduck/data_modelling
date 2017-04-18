class Event < ApplicationRecord
  belongs_to :host, class_name: "Guest"
  has_and_belongs_to_many :guests

end
