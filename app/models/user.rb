class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :first_name, presence: true,
  validate :last_name, presence: true,
  validate :address_1, presence: true,
  validate :zip_code, presence: true,
  validate :city, presence: true,
  validate :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez saisir un email valide s'il vous plaît." },
  validate :encrypted_password, presence: true, lenght: { minimum: 6 },
end
