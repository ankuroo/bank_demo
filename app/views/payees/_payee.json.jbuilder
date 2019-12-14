json.extract! payee, :id, :account_id, :name, :account_no, :sort_code, :created_at, :updated_at
json.url payee_url(payee, format: :json)
