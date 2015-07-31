json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :from, :to, :user_id, :company_id
  json.url event_url(event, format: :json)
end
