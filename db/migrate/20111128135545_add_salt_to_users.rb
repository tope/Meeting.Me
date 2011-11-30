class AddSaltToUsers < ActiveRecord::Migration
  def self.up
    rename_column	:users, :password, :encrypted_password
    add_column :users, :salt, :string, :limit => 40
  end

  def self.down
    remove_column :users, :salt
    rename_column	:users, :encrypted_password, :password
  end
end
