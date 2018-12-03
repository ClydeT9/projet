class UsersController < ApplicationController
    def show
      @user = User.friendly.find(params[:id])
      @softwares = @user.softwares
      @saved = Software.joins(:likes).where("likes.user_id=?", current_user.id) if @user == current_user
  end
end