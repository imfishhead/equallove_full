ActiveAdmin.register Question do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title,
              :admin_user_id,
							:description,
							:on,
							:main_pic,
							:video,
							:category_id,
							:type,
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
    f.inputs "Q&A" do
      f.input :admin_user_id,
                  as: :select2,
                  collection: AdminUser.all,
                  member_label: Proc.new { |x| "#{x.name}(#{x.email})" },
                  include_blank: false,
                  default: current_admin_user.id
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.is_subject
      f.input :on
      f.input :main_pic, as: :file, hint: f.object.main_pic.present? \
        ? image_tag(f.object.main_pic.url(:regular))
        : content_tag(:span, "no main_pic page yet")
      f.input :main_pic_cache, as: :hidden
      f.input :description, placeholder: "文章簡介，最多 50 字", maxlength: 50
      f.input :content
    end
    f.actions
  end
end
