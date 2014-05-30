class AddUrlFotoToDiputado < ActiveRecord::Migration
  def change
    add_column :diputados, :UrlFoto, :string
  end
end
