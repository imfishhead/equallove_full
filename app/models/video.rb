class Video < Post
	validates :title,
						:admin_user_id,
						:description,
						:on,
						:main_pic,
						:video,
						:category_id,
						presence: true,
						unless: Proc.new { |video| !video.on? }

end
