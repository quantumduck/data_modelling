class CreateFollowPairs < ActiveRecord::Migration[5.0]
  def change
    create_table :follow_pairs do |t|
      t.integer :leader_id
      t.integer :follower_id
    end
  end
end
