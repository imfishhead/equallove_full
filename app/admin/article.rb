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
              :front_page_pinned,
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
    column :category
    column :main_pic do |article|
      image_tag article.main_pic.url("regular"), style: "width: 100px; height: auto;"
    end
    column :admin_user do |article|
      article.admin_user.try(:name)
    end
    column :title
    column :description
    column :on
    column :content do |article|
      article.content.truncate(50)
    end
    column :video
    column :front_page_pinned
    column :pinned
    actions default: true
  end


  show do
    columns do
      column span: 4 do
        h1 "文章檢視"
        attributes_table  do
          row :id
          row :category
          row :main_pic do |article|
            image_tag article.main_pic.url('regular')
          end
          row :admin_user do |article|
            article.admin_user.try(:name)
          end
          row :title
          row :description
          row :on
          row :content do |article|
            raw(article.content)
          end
          row :video
          row :front_page_pinned
          row :pinned
        end
      end
    end
  end

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "圖文文章" do
      f.input :admin_user,
                  as: :select2,
                  collection: AdminUser.all,
                  member_label: Proc.new { |x| "#{x.name}(#{x.email})" },
                  include_blank: false,
                  default: current_admin_user.id
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.without_sub - Category.where("title LIKE ?", "%影音%"), input_html: { style: "width: 180px;" }
      f.input :pinned
      f.input :front_page_pinned
      f.input :on
      f.input :main_pic, as: :file, hint: f.object.main_pic.present? \
        ? image_tag(f.object.main_pic.url(:regular))
        : content_tag(:span, "no main_pic page yet")
      f.input :main_pic_cache, as: :hidden
      f.input :description, placeholder: "文章簡介"
      f.input :content, as: :ckeditor
    end
    f.actions
  end
end
