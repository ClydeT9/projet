class UsersController < ApplicationController
    def show
      @user = User.friendly.find(params[:id])
      @softwares = @user.softwares
      @saved = Software.joins(:likes).where("likes.user_id=?", current_user.id) if @user == current_user
    end

    def create
      # Create the user from params
      @user = User.new(params[:user])
      if @user.save
        # Deliver the signup email
        UserMailer.send_signup_email(@user).deliver
        redirect_to(@user, :notice => 'User created')
      else
        render :action => 'new'
      end
    end
end