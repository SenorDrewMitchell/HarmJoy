json.array!(@moment_types) do |moment_type|
  json.extract! moment_type, :id, :name, :description
  json.url moment_type_url(moment_type, format: :json)
end
