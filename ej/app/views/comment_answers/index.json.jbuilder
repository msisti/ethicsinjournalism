json.array!(@comment_answers) do |comment_answer|
  json.extract! comment_answer, :id, :content
  json.url comment_answer_url(comment_answer, format: :json)
end
