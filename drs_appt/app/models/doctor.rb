class Doctor < ApplicationRecord
  has_many :appointments
  has_many :primary_patients, class_name: "Patient", foreign_key: "pcp_id"
  has_many :patients, through: :appointments
end
