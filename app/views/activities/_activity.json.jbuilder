json.extract! activity, :id, :title, :type, :start_date, :end_date, :no_of_attendees, :name_and_guide, :created_at, :updated_at
json.url activity_url(activity, format: :json)
