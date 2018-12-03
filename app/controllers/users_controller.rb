class UsersController < ApplicationController
UserMailer.signup_confirmation(@user).deliver

    def show
      @user = User.friendly.find(params[:id])
      @softwares = @user.softwares
      @saved = Software.joins(:likes).where("likes.user_id=?", current_user.id) if @user == current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: "Succès"
    else
      render :new
    end
  end
end