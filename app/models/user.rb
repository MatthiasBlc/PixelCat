class User < ApplicationRecord

  has_many :carts
  has_many :items, through: :carts
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :first_name, presence: true
  #validates :last_name, presence: true
  #validates :address_1, presence: true
  #validates :zip_code, presence: true
  #validates :city, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez saisir un email valide s'il vous plaît." }
  validates :encrypted_password, presence: true, length: { minimum: 6 }


  # after_create :welcome_send
  # comment for the tests

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
