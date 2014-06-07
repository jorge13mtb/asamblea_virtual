json.array!(@preguntas) do |pregunta|
  json.extract! pregunta, :pregunta, :respuesta, :url_foto
end