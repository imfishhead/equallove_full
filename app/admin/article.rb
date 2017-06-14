ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title,
              :admin_user_id,
							:description,
							:content,
							:on,
              :main_pic,
              :main_pic_cache,
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

  index do |article|
    column :id
    column :main_pic do |article|
      article.main_pic.url("regular")
    end
    column :user do |article|
      article.user.try(:name)
    end
    column :title
    column :description
    column :on
    column :content
    column :video
    column :pinned
    actions default: true
  end


  show do
    columns do
      column span: 4 do
        h1 "文章檢視"
        attributes_table  do
          row :id
          row :main_pic do |article|
            image_tag article.main_pic.url('regular')
          end
          row :user
          row :title
          row :description
          row :on
          row :content do |article|
            raw(article.content)
          end
          row :video
          row :pinned
        end
      end
    end
  end

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "文章 - 圖文" do
      f.input :admin_user_id, as: :select2, collection: AdminUser.all, member_label: Proc.new { |x| "#{x.name}(#{x.email})" }, include_blank: false
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.is_main
      f.input :pinned
      f.input :on
      f.input :video, placeholder: "請輸入影片 youtube 網址"
      f.inputs "文章圖片", multipart: true do
        f.input :main_pic, as: :file, hint: f.object.main_pic.present? \
          ? image_tag(f.object.main_pic.url(:regular))
          : content_tag(:span, "no main_pic page yet")
        f.input :main_pic_cache, as: :hidden
      end
      f.input :description, placeholder: "文章簡介，最多 50 字", maxlength: 50
      f.input :content, as: :ckeditor
    end
    f.actions
  end
end
