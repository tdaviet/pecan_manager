class RenamePasswordColumn < ActiveRecord::Migration
  def self.up
    rename_column :users, :password, :user_password
    rename_column :users, :password_confirmation, :user_password_confirmation
  end

  def self.down
    rename_column :users, :user_password, :password
    rename_column :users, :user_password_confirmation, :password_confirmation
  end
end
