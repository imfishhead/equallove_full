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
							:type
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do |video|
    column :id
    column :category
    column :main_pic do |video|
      image_tag video.main_pic.url("regular"), style: "width: 100px; height: auto;"
    end
    column :admin_user do |video|
      video.admin_user.try(:name)
    end
    column :title
    column :description
    column :on
    column :video
    actions default: true
  end


  show do
    columns do
      column span: 4 do
        h1 "影片檢視"
        attributes_table  do
          row :id
          row :category
          row :main_pic do |video|
            image_tag video.main_pic.url('regular')
          end
          row :admin_user do |video|
            video.admin_user.try(:name)
          end
          row :title
          row :description
          row :on
          row :video
        end
      end
    end
  end

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "影片" do
      f.input :admin_user_id,
                  as: :select2,
                  collection: AdminUser.all,
                  member_label: Proc.new { |x| "#{x.name}(#{x.email})" },
                  include_blank: false,
                  default: current_admin_user.id
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.is_main, input_html: { style: "width: 200px;" }
      f.input :on
      f.input :video, placeholder: "請輸入影片 youtube 網址"
      f.input :main_pic, as: :file, hint: f.object.main_pic.present? \
        ? image_tag(f.object.main_pic.url(:regular))
        : content_tag(:span, "no main_pic page yet")
      f.input :main_pic_cache, as: :hidden
      f.input :description
    end
    f.actions
  end
end
