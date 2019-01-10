ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :name, :id, :provider, :role_editor

index do
    selectable_column
    column "Photo" do |user|
    if user.avatar.attached?
        image_tag url_for(user.avatar), class:'image_wrapper'
    else
        image_tag url_for("default_image.png"), class:'image_wrapper'
    end
    end
    column "ID", sortable: true do |user|
        link_to user.id, admin_user_path(user)
      end
    column "Email" do |user|
        link_to user.email, admin_user_path(user)
      end
      column "Éditeur", sortable: true do |user|
        user.role_editor
      end
      column "Provider" do |user|
        user.provider
      end
      column "Créer le",sortable: true do |user|
        user.created_at
      end
      column "Dernière connexion",sortable: true do |user|
        user.last_sign_in_at
      end
      column "Nbre de connexion",sortable: true do |user|
        user.sign_in_count
      end
      column "Nbre de likes",sortable: true do |user|
        user.find_liked_items.size
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
