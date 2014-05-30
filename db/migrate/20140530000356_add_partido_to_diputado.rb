class AddPartidoToDiputado < ActiveRecord::Migration
  def change
    add_column :diputados, :Partido, :string
  end
end
