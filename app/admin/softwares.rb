ActiveAdmin.register Software do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :logo

form do |f|
  f.inputs do
    f.input :title
    f.input :logo, as: :file
    f.actions
  end
end

index do
    selectable_column
    column "Logo" do |software|
        image_tag url_for(software.logo), class:'image_wrapper'
      end
    column "ID" do |software|
        software.id
      end
    column "Nom" do |software|
      link_to software.title, admin_software_path(software)
    end
    column "URL" do |software|
        software.software_url
      end
      column "Éditeur" do |software|
        software.editeur
      end
      column "User" do |software|
        link_to software.user.name, admin_user_path(software.user)
      end
      column "Créer le" do |software|
        software.created_at
      end
  end

show do
    attributes_table do
      row :title
      row :logo do |ad|
        image_tag url_for(ad.logo)
      end
    end
  end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
end
