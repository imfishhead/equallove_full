class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :admin_user

	mount_uploader :main_pic, MainPicUploader
end
