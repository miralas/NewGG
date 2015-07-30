json.array!(@company_news) do |company_news|
  json.extract! company_news, :id, :company_id, :user_id, :title, :body, :published
  json.url company_news_url(company_news, format: :json)
end
