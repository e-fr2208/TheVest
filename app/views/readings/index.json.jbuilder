json.array!(@readings) do |reading|
  json.extract! reading, :id, :systolic, :diastolic, :heart_rate
  json.url reading_url(reading, format: :json)
end
