class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :start_time
      t.decimal :length
      t.string :type
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
