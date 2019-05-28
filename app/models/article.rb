class Article < Post
  after_save :check_only_two_pinned
  validates :title,
            :admin_user_id,
            :content,
            :on,
            :main_pic,
            :category_id,
            presence: true,
            unless: Proc.new { |article| !article.on? }

  scope :pinned, -> { where(pinned: true) }

  def check_only_two_pinned
    (Article.all - Article.pinned.order(updated_at: :desc).first(2)).each do |article|
      article.update(pinned: false)
    end if Article.pinned.size > 2 && pinned_changed? && pinned?
  end
end
