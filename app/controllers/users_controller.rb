class UsersController < ApplicationController
    def show
      @user = User.friendly.find(params[:id])
      @softwares = @user.softwares
      @comments = current_user.comments
    end
end