class Question < Post
	validates :title,
						:admin_user_id,
						:description,
						:content,
						:on,
						:main_pic,
						:category_id,
						presence: true
end
