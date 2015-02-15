json.array!(@rounds) do |round|
  json.extract! round, :id, :character, :city, :country, :river, :points
  json.url round_url(round, format: :json)
end
