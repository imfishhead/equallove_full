class Article < Post
  before_save :check_only_two_pinned
  validates :title,
            :admin_user_id,
            :description,
            :content,
            :on,
            :main_pic,
            :video,
            :category_id,
            :pinned,
            presence: true

  def check_only_two_pinned
    Article.pinned.order(updated_at: :desc).first.update(pinned: false) if Article.pinned.size > 2
  end
end
