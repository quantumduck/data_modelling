class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.text :mailing_address
      t.string :name

      t.timestamps
    end
  end
end
