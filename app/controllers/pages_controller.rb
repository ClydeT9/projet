class PagesController < ApplicationController
    before_action :authenticate_editor!, only: [:myapp]

    def myapp
        @softwares = current_editor.softwares
    end
end