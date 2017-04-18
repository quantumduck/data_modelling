class User < ApplicationRecord
  has_many :tweets
  has_and_belongs_to_many :followers,
    class_name: "User",
    foreign_key: "leader_id",
    association_foreign_key: "follower_id",
    join_table: "follow_pairs"
  has_many :retweets
  has_many :retweeters, through: :retweets,
    class_name: "User",
    foreign_key: "user_id",
    source: "source"
  has_many :retweeted_tweets, through: :retweets,
    class_name: "Tweet",
    foreign_key: "source_id",
    source: "user"

    def follow(user)
      user.followers << self
    end

    def unfollow(user)
      user.followers.delete(self)
    end

end
