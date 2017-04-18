class User < ApplicationRecord
  has_many :created_repositories, class_name: "Repository", foreign_key: "creator_id"
  has_and_belongs_to_many :repositories
end
