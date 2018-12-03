class ApplicationController < ActionController::Base
    layout proc{|c| c.request.xhr? ? false : "application" } #permet d'avoir un render différent avec js et html (render false pour les modal)
    before_action :store_user_location!, if: :storable_location?
    # The callback which stores the current location must be added before you authenticate the user 
    # as `authenticate_user!` (or whatever your resource is) will halt the filter chain and redirect 
    # before the location can be stored.
    before_action :authenticate_user!
    before_action :correct_domain!

  
    private
    def correct_domain!
      unless request.host == 'https://www.uneapp.com'
        redirect_to root_url, :status => 301  # or explicitly 'http://www.mysite.com/'
      end
    end
      # Its important that the location is NOT stored if:
      # - The request method is not GET (non idempotent)
      # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an 
      #    infinite redirect loop.
      # - The request is an Ajax request as this can lead to very unexpected behaviour.
      def storable_location?
        request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
      end
  
      def store_user_location!
        # :user is the scope we are authenticating
        store_location_for(:user, request.fullpath)
      end
end