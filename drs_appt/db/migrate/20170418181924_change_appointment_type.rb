class ChangeAppointmentType < ActiveRecord::Migration[5.0]
  def change
    rename_column :appointments, :type, :purpose
  end
end
