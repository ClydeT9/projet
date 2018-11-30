module ApplicationHelper

    #avatar user
    def avatar_url(user)
      if user.avatar.present?
          user.avatar.url
      else
          'default_image.png'
      end
    end
        #logo software
        def logo_url(software)
          if software.logo.present?
              software.logo.url
          else
              'logo_download.png'
          end
        end
    
    #   Devise login modal 
    def resource_name
        :user
      end
     
      def resource
        @resource ||= User.new
      end
    
      def resource_class
        User
      end
     
      def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
      end

      #pour member
            def resource_name_editor
              :editor
            end
           
            def resource_editor
              @resource ||= Editor.new
            end
          
            def resource_class_editor
              Editor
            end
           
            def devise_mapping_editor
              @devise_mapping_editor ||= Devise.mappings[:editor]
            end
end
