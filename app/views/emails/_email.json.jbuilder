json.extract! email, :id, :from, :body, :to, :subject, :user_id, :created_at, :updated_at
json.url email_url(email, format: :json)