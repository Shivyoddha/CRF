json.extract! gait, :id, :subject, :measurement, :trials, :force_plate, :clinical_trial, :physician, :more, :status, :slotdate, :slottime, :debit, :created_at, :updated_at
json.url gait_url(gait, format: :json)
