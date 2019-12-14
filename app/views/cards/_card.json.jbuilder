json.extract! card, :id, :account_id, :card_no, :expiry_date, :cvv, :pin, :status, :created_at, :updated_at
json.url card_url(card, format: :json)
