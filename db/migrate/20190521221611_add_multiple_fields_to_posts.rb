class AddMultipleFieldsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :place, :string
    add_column :posts, :post_time, :datetime
    add_column :posts, :phone, :string
  end
end