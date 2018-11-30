class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:myapp]

    def myapp
        @softwares = current_user.softwares.order("published_at desc")
    end
end