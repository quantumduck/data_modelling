class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweeters, through: :retweets,
    source: :user
  has_many :retweets, foreign_key: "source_id"
end
