class UsersAddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :authorization_token, :string
    add_column :users, :refresh_token, :string
    add_column :users, :auth_token_expires_at, :integer

    add_index :users, :uid, unique: true
  end
end
