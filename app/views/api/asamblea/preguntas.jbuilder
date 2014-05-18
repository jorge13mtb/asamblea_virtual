json.array!(@preguntas) do |pregunta|
  json.extract! pregunta, :pregunta, :respuesta, :usuario_id
end