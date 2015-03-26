json.array!(@representments) do |representment|
  json.extract! representment, :id, :user_id, :question_id, :collection_id, :rate
  json.url representment_url(representment, format: :json)
end
