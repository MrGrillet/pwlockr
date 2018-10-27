json.extract! faq, :id, :title, :excerpt, :answer, :created_at, :updated_at
json.url faq_url(faq, format: :json)
