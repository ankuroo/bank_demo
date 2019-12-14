# Model for Accounts which is part of devise
class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:username]


  # Validation for uniqueness of email and username
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # Associations that an account has
  has_many :cards # An account can have many bank cards
  has_many :payees # An account can have many payees

end
