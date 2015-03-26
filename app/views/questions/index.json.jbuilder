json.array!(@questions) do |question|
  json.extract! question, :id, :content, :reference
  json.url question_url(question, format: :json)
end
