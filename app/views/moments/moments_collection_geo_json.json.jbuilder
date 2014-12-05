@tags.each do |tag|
  json.set! tag.name do
    json.array! tag.moments do |moment|
      json.type "Feature"
      json.properties do
        json.name moment.name
        json.popupContent moment.name.to_s + " - " + moment.description.to_s
      end
      json.geometry do
        json.type "Point"
        json.coordinates moment.geo_json_long_lat_array
      end
    end
  end
end