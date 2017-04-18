class Patient < ApplicationRecord
  belongs_to :pcp, class_name: "Doctor"
  has_many :appointments
  has_many :doctors, through: :appointments
end
