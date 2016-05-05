json.array!(@offers) do |offer|
  json.extract! offer, :id, :offer_type, :details
  json.url offer_url(offer, format: :json)
end
