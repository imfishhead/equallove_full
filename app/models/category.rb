class Category < ActiveRecord::Base
	has_many :posts
	has_many :stores
	has_many :articles
	has_many :videos
	has_many :questions
	belongs_to :parent, foreign_key: :parent_id, class_name: "Category"
	has_many :sub_categories, foreign_key: :parent_id, class_name: "Category"
  accepts_nested_attributes_for :sub_categories, allow_destroy: true

  scope :is_subject, -> { where.not(parent_id: nil) }
  scope :is_main, -> { where(parent_id: nil) }
	scope :on, -> { where(on: true) }
	scope :without_posts, -> { includes(:posts).where(posts: { id: nil }) }
	scope :with_posts, -> { joins(:posts) }

	def is_main?
		parent_id.nil?
	end

	def is_subject?
		!parent_id.nil?
	end

	def self.without_sub
		Category.where(parent_id: nil).where.not(id: Category.pluck(:parent_id))
	end
end
