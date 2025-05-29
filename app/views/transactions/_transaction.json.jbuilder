json.extract! transaction, :id, :title, :amount, :category, :occurred_on, :notes, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
