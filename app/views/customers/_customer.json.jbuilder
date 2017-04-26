json.extract! customer, :id, :date, :machine, :game, :age, :gender, :race, :income, :group_type, :group_size, :created_at, :updated_at
json.url customer_url(customer, format: :json)
