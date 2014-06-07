class AddUrlFototoPreguntasDiputado < ActiveRecord::Migration
  def change
    add_column :preguntas_diputados, :url_foto, :text
  end
end
