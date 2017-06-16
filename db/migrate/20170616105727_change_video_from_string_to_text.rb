class ChangeVideoFromStringToText < ActiveRecord::Migration
  def change
  	change_column :posts, :video, :text
  end
end
