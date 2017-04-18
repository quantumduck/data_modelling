class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time
      t.decimal :length
      t.integer :min_age
      t.string :location
      t.text :description
      t.integer :host_id

      t.timestamps
    end
  end
end
