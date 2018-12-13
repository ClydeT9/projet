class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:myapp]

    def myapp
        @softwares = current_user.softwares.order("published_at desc")
    end

    def search
        @softwares = Software.ransack(title_or_slogan_cont: params[:q]).result(distinct: true)
        @categories = Category.ransack(name_cont: params[:q]).result(distinct: true)

        respond_to do |format|
            format.html {}
            format.json {
              @softwares    = @softwares.limit(5)
              @categories = @categories.limit(5)
            }
          end
end
end