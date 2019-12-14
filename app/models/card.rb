# Model for a Bank Card
class Card < ApplicationRecord
  # Associations of Card
  belongs_to :account # Is dependent on account

  # Validation - These attributes have to be of certain lengths
  validates :card_no, length: {is: 16}
  validates :cvv, length: {is: 3}
  validates :pin, length: {is: 4}

end
