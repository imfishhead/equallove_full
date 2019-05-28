module ApplicationHelper
	def is_active(category_name)
		return unless @category
		return 'active' if @category.id.to_s == Category.find_by(title: category_name).id.to_s 
	end
end
