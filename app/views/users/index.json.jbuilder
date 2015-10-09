json.array!(@users) do |user|
  json.extract! user, :id, :name, :address, :city, :state, :zip, :school, :years_in_practice
  json.url user_url(user, format: :json)
end
