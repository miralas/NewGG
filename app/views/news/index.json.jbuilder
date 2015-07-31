json.array!(@news) do |news|
  json.extract! news, :id, :title, :body, :published, :user_id, :company_id
  json.url news_url(news, format: :json)
end
