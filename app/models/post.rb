class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :admin_user
	before_save :only_one_post_pinned_per_category
	before_save :check_post_should_be_on_if_pinned

	scope :on, -> { where(on: true) }
	scope :front_page_pinned, -> { where(front_page_pinned: true) }
	scope :without, -> id { where.not(id: id) if id }

	mount_uploader :main_pic, MainPicUploader

	def only_one_post_pinned_per_category
		category.posts.without(id).update_all(front_page_pinned: false) if front_page_pinned?
	end

	def check_post_should_be_on_if_pinned
		errors.add(:on, "置頂的話此篇必須也要開啟喔！") if front_page_pinned? && !on?
	end
end
