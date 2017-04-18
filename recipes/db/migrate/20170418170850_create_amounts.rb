class CreateAmounts < ActiveRecord::Migration[5.0]
  def change
    create_table :amounts do |t|
      t.decimal :value
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
