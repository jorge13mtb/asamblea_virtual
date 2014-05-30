json.array!(@diputados) do |diputado|
  json.extract! diputado, :nombre, :email, :Provincia, :Partido, :descripcion, :UrlFoto
  json.url diputado_url(diputado, format: :json)
end