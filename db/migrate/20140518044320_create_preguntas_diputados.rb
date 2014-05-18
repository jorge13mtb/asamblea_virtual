class CreatePreguntasDiputados < ActiveRecord::Migration
  def change
    create_table :preguntas_diputados do |t|
      t.text :pregunta
      t.text :respuesta
      t.integer :diputado_id

      t.timestamps
    end
    add_index :preguntas_diputados, [:diputado_id, :created_at]
  end
end
