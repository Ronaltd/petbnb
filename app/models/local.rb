class Local < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :city, presence: true
  validates :descritpion, presence: true, length: {maximum:300}
  validates :price, presence: true

end
