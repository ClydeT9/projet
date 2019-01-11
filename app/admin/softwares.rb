ActiveAdmin.register Software do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :editeur, :description, :logo, :slug, :slogan, :approved, :software_url, :user

form do |f|
  f.inputs do
    f.input :title
    f.input :slogan
    f.input :slug
    f.input :user
    f.input :software_url
    f.check_box :approved
    f.input :description
    f.input :editeur
    f.input :logo, as: :file
    f.actions
  end
end

index do
    selectable_column
    column "Logo" do |software|
        image_tag url_for(software.logo), class:'image_wrapper'
      end
    column "Like", sortable: :cached_votes_total do |software|
        software.cached_votes_total
      end
    column "Nom" do |software|
      link_to software.title, admin_software_path(software)
    end
    column "Approuvé" do |software|
      software.approved
    end
    column "URL" do |software|
        software.software_url
      end
      column "Slug" do |software|
        software.slug
      end
      column "Éditeur" do |software|
        software.editeur
      end
      column "User" do |software|
        link_to software.user.name, admin_user_path(software.user)
      end
      column "Créer le",sortable: :created_at do |software|
        software.created_at
      end
  end

show do
    attributes_table do
      row :cached_votes_total
      row :title
      row :slug
      row :editeur
      row :slogan
      row :software_url
      row :user
      row :logo do |ad|
        image_tag url_for(ad.logo)
      end
      row :description
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
