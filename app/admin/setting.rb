ActiveAdmin.register Setting do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
controller do
  actions :all, except: [:new, :destroy]
end
permit_params :var, :value
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	show do
		columns do
		  column span: 4 do
		    h1 "進度條進度"
		    attributes_table  do
		      row :value do |p|
		      	t("progress.#{p.value}")
		      end
		    end
		  end
		end
	end

	form do |f|
		f.semantic_errors *f.object.errors.keys
		f.inputs "進度條進度" do
			f.input :var, input_html: { readonly: true }
			f.input :value,
				as: :select2,
				collection: I18n.backend.send(:translations)[:'zh-TW'][:progress].map { |s| [s[1], s[0]] },
				member_label: Proc.new { |x| "#{x[0]}" },
				include_blank: false
		end
		f.actions
	end
end
