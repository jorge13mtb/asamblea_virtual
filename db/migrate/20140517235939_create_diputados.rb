class CreateDiputados < ActiveRecord::Migration
  def change
    create_table :diputados do |t|
      t.string :nombre
      t.string :email
      t.text :descripcion

      t.timestamps
    end
  end
end
