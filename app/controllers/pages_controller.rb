class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:myapp]

    def myapp
        @softwares = current_user.softwares.order("published_at desc")
    end

    def search
        @softwares = Software.ransack(title_or_slogan_cont: params[:q]).result(distinct: true).paginate(:page => params[:page], :per_page => 14).order("published_at desc")
        @categories = Category.ransack(name_cont: params[:q]).result(distinct: true)

        respond_to do |format|
            format.html {}
            format.json {
              @softwares = @softwares.includes(:categories).limit(5)
              @categories = @categories.limit(5)
            }
          end
end
end