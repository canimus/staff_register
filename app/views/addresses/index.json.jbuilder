json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :suburb, :postcode, :state, :country, :used_for
  json.url address_url(address, format: :json)
end
