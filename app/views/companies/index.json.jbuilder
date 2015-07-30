json.array!(@companies) do |company|
  json.extract! company, :id, :company_type, :company_name, :about, :website, :owner_id, :photo, :is_payed
  json.url company_url(company, format: :json)
end
