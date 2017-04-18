class Recipe < ApplicationRecord
  has_many :amounts
  has_many :ingredients, through: :amounts
end
