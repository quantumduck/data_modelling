class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :source, class_name: "Tweet"
end
