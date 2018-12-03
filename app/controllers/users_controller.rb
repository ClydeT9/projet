class UsersController < ApplicationController
    def show
      @user = User.friendly.find(params[:id])
      @softwares = @user.softwares
      @saved = Software.joins(:likes).where("likes.user_id=?", current_user.id) if @user == current_user
    end

    def create
      @user = User.new(params[:user])
   
      respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome email after save
          UserMailer.with(user: @user).welcome_email.deliver_now
   
          format.html { redirect_to(@user, notice: 'User was successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

end