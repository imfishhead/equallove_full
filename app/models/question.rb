class Question < Post
	validates :title,
						:admin_user_id,
						:content,
						:on,
						:category_id,
						presence: true
end
