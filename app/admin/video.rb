ActiveAdmin.register Video do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title,
							:description,
							:on,
							:main_pic,
							:video,
							:category_id,
							:type,
							:pinned
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "文章 - 影片" do
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.is_main
      f.input :pinned
      f.input :on
      f.input :video
      f.input :main_pic
    end
    f.actions
  end
end
