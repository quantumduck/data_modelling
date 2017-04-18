class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweeters, through: :retweets,
    class_name: "User",
    foreign_key: "user_id"
  has_many :retweets, foreign_key: "source_id"
end
