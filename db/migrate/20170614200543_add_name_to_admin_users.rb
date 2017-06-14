class AddNameToAdminUsers < ActiveRecord::Migration
  def change
  	add_column :admin_users, :name, :string
  end
end
