json.extract! feedback, :id, :username, :email, :feedback, :date, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
