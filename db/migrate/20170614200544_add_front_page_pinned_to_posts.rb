class AddFrontPagePinnedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :front_page_pinned, :boolean, default: false
  end
end
