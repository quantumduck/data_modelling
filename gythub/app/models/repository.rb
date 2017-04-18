class Repository < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :users
  has_many :forks, class_name: "Repository", foreign_key: "fork_id"
  belongs_to :source_repository, class_name: "Repository", optional: true

  # before_save: populate_parent_repo

  def fork(user)
    create(name: self.name, path: self.path, creator_id: user.id, fork_id: self.id)
  end

  def forkable?
    self.repository_id == 0
  end

  # def populate_parent_repo
  #
  # end

end
