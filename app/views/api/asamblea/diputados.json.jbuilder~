json.array!(@centros) do |centro|
  json.extract! centro, :nombre, :latitud, :longitud, :tipo, :horario, :descripcion
  json.url centro_url(centro, format: :json)
end
