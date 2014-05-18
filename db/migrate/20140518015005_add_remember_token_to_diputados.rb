class AddRememberTokenToDiputados < ActiveRecord::Migration
  def change
    add_column :diputados, :remember_token, :string
    add_index  :diputados, :remember_token
  end
end
