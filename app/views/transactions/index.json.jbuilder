json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :amount, :account_id, :date_on, :note
  json.url transaction_url(transaction, format: :json)
end
