json.array!(@comment_prompts) do |comment_prompt|
  json.extract! comment_prompt, :id
  json.url comment_prompt_url(comment_prompt, format: :json)
end
