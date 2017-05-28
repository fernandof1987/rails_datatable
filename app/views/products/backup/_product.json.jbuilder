json.extract! product, :id, :description, :product_subgroup_id, :cost_price, :sale_price, :created_at, :updated_at
json.url product_url(product, format: :json)
