class Article < Post
	before_save :check_only_two_pinned

	def check_only_two_pinned
		Article.pinned.order(updated_at: :desc).first.update(pinned: false) if Article.pinned.size > 2
	end
end
