class Repository < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :users
  has_many :forks, class_name: "Repository", foreign_key: "fork_id"
  belongs_to :source, class_name: "Repository"
end
