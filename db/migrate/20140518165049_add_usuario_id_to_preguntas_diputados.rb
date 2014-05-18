class AddUsuarioIdToPreguntasDiputados < ActiveRecord::Migration
  def change
   add_column :preguntas_diputados, :usuario_id, :integer
   add_index :preguntas_diputados, :usuario_id  
  end
end
