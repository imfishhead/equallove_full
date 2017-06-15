module ApplicationHelper
  def is_active(id, category)
    "active" if id.to_i == category.id
  end
end
