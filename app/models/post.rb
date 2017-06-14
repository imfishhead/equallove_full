class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :admin_user
	before_save :only_one_post_pinned_per_category

	scope :on, -> { where(on: true) }
	scope :without, -> id { where.not(id: id) if id }

	mount_uploader :main_pic, MainPicUploader

	def only_one_post_pinned_per_category
		category.articles.without(id).update_all(front_page_pinned: false)
	end
end
