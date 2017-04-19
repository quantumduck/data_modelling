class Director < ApplicationRecord
  has_many :films
  has_and_belongs_to_many :actors, through: :films
end
