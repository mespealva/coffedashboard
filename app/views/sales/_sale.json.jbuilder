json.extract! sale, :id, :quantity, :product_id, :date, :amount, :created_at, :updated_at
json.url sale_url(sale, format: :json)
