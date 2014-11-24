json.array!(@moments) do |moment|
  json.extract! moment, :id, :name, :description, :source, :lat, :long, :moment_type_id, :asset_id, :race_date_id, :active
  json.url moment_url(moment, format: :json)
end
