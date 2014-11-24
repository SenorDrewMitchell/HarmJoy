json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :active
  json.url tag_url(tag, format: :json)
end
