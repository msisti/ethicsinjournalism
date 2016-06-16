json.array!(@comment_forms) do |comment_form|
  json.extract! comment_form, :id
  json.url comment_form_url(comment_form, format: :json)
end
