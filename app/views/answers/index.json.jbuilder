json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :content, :correct, :comment
  json.url answer_url(answer, format: :json)
end
