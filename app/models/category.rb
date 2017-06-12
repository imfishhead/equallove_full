class Category < ActiveRecord::Base
	has_many :posts
	belongs_to :parent, foreign_key: :parent_id, class_name: "Category"
	has_many :sub_categories, foreign_key: :parent_id, class_name: "Category"
  accepts_nested_attributes_for :sub_categories, allow_destroy: true
end
