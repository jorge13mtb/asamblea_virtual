json.array!(@diputados) do |diputado|
  json.extract! diputado, :nombre
end