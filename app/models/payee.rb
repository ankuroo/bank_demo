class Payee < ApplicationRecord
  # Associations of Payee
  belongs_to :account

  # Validation - These attributes have to be of certain length
  validates :account_no, length: {is: 8}
  validates :sort_code, length: {is: 8}

end
