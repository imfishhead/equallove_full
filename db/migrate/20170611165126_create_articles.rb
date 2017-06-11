class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title
    	t.text :description
    	t.text :content
    	t.boolean :on, default: true
    	t.string :main_pic
    	t.string :video
    	t.integer :category_id
    	t.string :type # Question, Video, nil

      t.timestamps null: false
    end
  end
end
