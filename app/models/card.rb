class Card < ApplicationRecord
  belongs_to :account

  validates :card_no, length: {is: 16}
  validates :cvv, length: {is: 3}
  validates :pin, length: {is: 4}

end
