json.array!(@diputados) do |diputado|
  json.extract! diputado, :nombre, :email, :Provincia, :Partido, :descripcion, :UrlFoto, :cantidad_asistencias, 
                          :cantidad_proyectos, :texto_proyectos, :texto_comisiones, :sexo
end