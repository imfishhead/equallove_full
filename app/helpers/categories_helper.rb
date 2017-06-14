module CategoriesHelper
  def is_active(category)
    "active" if params[:id].to_i == category.id
  end
end
