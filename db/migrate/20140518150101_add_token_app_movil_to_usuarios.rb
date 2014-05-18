class AddTokenAppMovilToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :token_app_movil, :string
    add_index  :usuarios, :token_app_movil
  end
end
