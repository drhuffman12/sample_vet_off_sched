json.array!(@pets) do |pet|
  json.extract! pet, :id, :user_id, :name, :pet_type, :breed, :age, :weight
  json.url pet_url(pet, format: :json)
end
