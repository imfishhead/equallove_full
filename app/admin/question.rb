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

  index do |article|
    column :id
    column :category
    column :admin_user do |article|
      article.admin_user.try(:name)
    end
    column :title
    column :on
    column :content do |article|
      article.content.truncate(50)
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
          row :admin_user do |article|
            article.admin_user.try(:name)
          end
          row :title
          row :on
          row :content do |article|
            article.content
          end
        end
      end
    end
  end

  form do |f|
  	f.semantic_errors *f.object.errors.keys
    f.inputs "問與答" do
      f.input :admin_user_id,
                  as: :select2,
                  collection: AdminUser.all,
                  member_label: Proc.new { |x| "#{x.name}(#{x.email})" },
                  include_blank: false,
                  default: current_admin_user.id
      f.input :title
      f.input :category, as: :select2, include_blank: false, collection: Category.is_subject, input_html: { style: "width: 200px;" }
      f.input :on
      f.input :content
    end
    f.actions
  end
end
