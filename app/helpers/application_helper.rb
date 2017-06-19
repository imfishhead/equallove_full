module ApplicationHelper
  def is_active(id, category)
  	unless id.nil?
	    "active" if id.to_i == category.id
	  end
  end
end
