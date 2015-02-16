json.array!(@solutions) do |solution|
  json.extract! solution, :id, :solution, :category, :is_correct
  json.url solution_url(solution, format: :json)
end
