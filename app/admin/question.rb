ActiveAdmin.register Question do
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

  index do |question|
    column :id
    column :category
    column :admin_user do |question|
      question.admin_user.try(:name)
    end
    column :title
    column :on
    column :main_pic do |question|
      image_tag question.main_pic.url('regular')
    end
    column :description
    column :content do |question|
      question.content.truncate(50)
    end
    actions default: true
  end


  show do
    columns do
      column span: 4 do
        h1 "問與答檢視"
        attributes_table  do
          row :id
          row :category
          row :main_pic do |question|
            image_tag question.main_pic.url('regular')
          end
          row :admin_user do |question|
            question.admin_user.try(:name)
          end
          row :title
          row :on
          row :description
          row :content do |question|
            question.content
          end
        end
      end
    end
  end

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "問與答" do
      f.input :admin_user,
                  as: :select2,
                  collection: AdminUser.all,
                  member_label: Proc.new { |x| "#{x.name}(#{x.email})" },
                  include_blank: false,
                  default: current_admin_user.id
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.is_subject, input_html: { style: "width: 200px;" }
      f.input :on
      f.input :main_pic, as: :file, hint: f.object.main_pic.present? \
        ? image_tag(f.object.main_pic.url(:regular))
        : content_tag(:span, "no main_pic page yet")
      f.input :main_pic_cache, as: :hidden
      f.input :description
      f.input :content
    end
    f.actions
  end
end
