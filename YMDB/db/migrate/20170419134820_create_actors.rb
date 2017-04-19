class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.text :bio
      t.integer :birth
      t.integer :death

      t.timestamps
    end
  end
end
