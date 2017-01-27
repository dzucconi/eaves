json.extract! email, :id, :message_id, :user_id, :created_at, :updated_at
json.url email_url(email, format: :json)
