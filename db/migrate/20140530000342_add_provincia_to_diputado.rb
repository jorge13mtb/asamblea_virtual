class AddProvinciaToDiputado < ActiveRecord::Migration
  def change
    add_column :diputados, :Provincia, :string
  end
end
