class User < ApplicationRecord
  has_many :created_repositories, class_name: "Repository", foreign_key: "creator_id"
  has_and_belongs_to_many :repositories


  def fork(repo)
    created_repositories.create(name: repo.name, path: repo.path, creator_id: self.id, fork_id: repo.id)
  end

  def create_repository(name: name, path: path)
    created_repositories.create(name: name, path: path, creator_id: self.id, fork_id: 0)
  end


end
