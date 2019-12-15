json.extract! transaction, :id, :account_id, :payee_id, :amount, :reference, :initial_bal, :final_bal, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
