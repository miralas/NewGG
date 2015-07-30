json.array!(@company_vacancies) do |company_vacancy|
  json.extract! company_vacancy, :id, :company_id, :title, :salary, :requirements, :description
  json.url company_vacancy_url(company_vacancy, format: :json)
end
