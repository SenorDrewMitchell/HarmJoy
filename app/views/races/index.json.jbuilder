json.array!(@races) do |race|
  json.extract! race, :id, :name, :start_day_id, :end_day_id
  json.url race_url(race, format: :json)
end
