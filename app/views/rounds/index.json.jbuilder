json.array!(@rounds) do |round|
  json.extract! round, :id, :character, :points, :roundcount
  json.url round_url(round, format: :json)
end
