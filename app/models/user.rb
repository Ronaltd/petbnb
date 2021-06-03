class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :locals, dependent: :destroy
  has_many :bookings, dependent: :destroy # validar informacao com o TA

 # validates :first_name, presence: true
 # validates :last_name, presence: true
 # validates :username, presence: true, uniqueness: true
 # validates :phone, presence: true
 # validates :email, presence: true, uniqueness: true

end
