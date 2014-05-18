class AddIndexToDiputadosEmail < ActiveRecord::Migration
  def change
    add_index :diputados, :email, unique: true
  end
end
