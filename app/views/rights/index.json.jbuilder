json.array!(@rights) do |right|
  json.extract! right, :id, :user_id, :role_id
  json.url right_url(right, format: :json)
end
