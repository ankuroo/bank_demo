class Transaction < ApplicationRecord

  # Associations of a transaction
  belongs_to :account
  belongs_to :payee
end
