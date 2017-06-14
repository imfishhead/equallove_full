ActiveAdmin.register Video do
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
      f.input :admin_user_id,
                  as: :select2,
                  collection: AdminUser.all,
                  member_label: Proc.new { |x| "#{x.name}(#{x.email})" },
                  include_blank: false,
                  default: current_admin_user.id
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.is_main
      f.input :pinned
      f.input :on
      f.input :video, placeholder: "請輸入影片 youtube 網址"
      f.input :main_pic, as: :file, hint: f.object.main_pic.present? \
        ? image_tag(f.object.main_pic.url(:regular))
        : content_tag(:span, "no main_pic page yet")
      f.input :main_pic_cache, as: :hidden
    end
    f.actions
  end
end
