class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :local

  validates :pet_name, presence: true
  validates :pet_type, presence: true
  validates :pet_weight, presence: true
end
