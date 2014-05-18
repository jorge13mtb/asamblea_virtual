class AddPasswordDigestToDiputados < ActiveRecord::Migration
  def change
    add_column :diputados, :password_digest, :string
  end
end
