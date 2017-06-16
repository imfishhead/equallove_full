ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :id, :title, :parent_id, :on, sub_categories_attributes: [:id, :title, :parent_id, :on]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	show do
		h3 "分類"
	  attributes_table do
	    row :title
	    row :on
	    category.sub_categories.each do |c|
		    attributes_table do
  		   	row :title do
  		   		c.title
  		   	end
  		   	row :on do
  		   		c.on
  		   	end
  			end
	    end
	  end
	end

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "分類" do
      f.input :title
      f.input :on
    end
    f.inputs do
      f.has_many :sub_categories do |a|
        a.input :title
        a.input :on
      end
    end unless Category.without_sub.exists?(f.object) || !f.object.persisted?
    f.actions
  end
end
