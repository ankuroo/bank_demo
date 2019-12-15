class Transaction < ApplicationRecord

  validates :amount, numericality: { greater_than: 0}

  # Associations of a transaction
  belongs_to :account
  belongs_to :payee
end
