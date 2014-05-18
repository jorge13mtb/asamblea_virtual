json.array!(@diputados) do |diputado|
  json.extract! diputado, :id
  json.url diputado_url(diputado, format: :json)
end
