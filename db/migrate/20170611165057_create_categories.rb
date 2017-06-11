class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string  :title
    	t.integer :parent_id
    	t.boolean :on, default: true

      t.timestamps null: false
    end
  end
end
