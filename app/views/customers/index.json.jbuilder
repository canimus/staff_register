json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :fiscal_name, :abn
  json.url customer_url(customer, format: :json)
end
