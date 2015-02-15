json.array!(@rundes) do |runde|
  json.extract! runde, :id, :buchstabe, :stadt, :land, :fluss, :punkte
  json.url runde_url(runde, format: :json)
end
