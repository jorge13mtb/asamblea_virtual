json.array!(@diputados) do |diputado|
  json.extract! diputado, :nombre, :email, :descripcion
  json.url diputado_url(diputado, format: :json)
end