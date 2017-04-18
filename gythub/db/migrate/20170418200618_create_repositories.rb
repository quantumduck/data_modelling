class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :path
      t.integer :creator_id
      t.integer :fork_id

      t.timestamps
    end
  end
end
