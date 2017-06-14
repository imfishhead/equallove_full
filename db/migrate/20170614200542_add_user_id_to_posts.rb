class AddUserIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :admin_user_id, :integer
  end
end
