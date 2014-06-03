class AddnewcolumnsToDiputado < ActiveRecord::Migration
  def change
    add_column :diputados, :cantidad_asistencias, :integer
    add_column :diputados, :cantidad_proyectos, :integer
    add_column :diputados, :texto_proyectos, :text
    add_column :diputados, :texto_comisiones, :text
    add_column :diputados, :sexo, :string
  end
end
