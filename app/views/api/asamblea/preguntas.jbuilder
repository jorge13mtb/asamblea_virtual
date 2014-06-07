json.array!(@preguntas) do |pregunta|
  json.extract! pregunta, :pregunta, :respuesta, :usuario_id, :url_foto
end