json.array!(@race_days) do |race_day|
  json.extract! race_day, :id, :name, :race_date, :race_id
  json.url race_day_url(race_day, format: :json)
end
