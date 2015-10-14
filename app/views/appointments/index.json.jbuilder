json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :user_id, :pet_id, :date_of_visit, :reminder, :reason
  json.url appointment_url(appointment, format: :json)
end
