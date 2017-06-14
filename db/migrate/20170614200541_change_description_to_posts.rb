class ChangeDescriptionToPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :description, :string
  end
end
