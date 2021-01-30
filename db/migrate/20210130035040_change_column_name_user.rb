class ChangeColumnNameUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password, :token_auth
  end
end
