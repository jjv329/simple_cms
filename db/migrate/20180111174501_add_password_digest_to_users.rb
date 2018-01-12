class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column "admin_users", "hashed_password", :string
    add_column :admin_users, :password_digest, :string
  end
end
