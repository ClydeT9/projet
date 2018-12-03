class UsersController < ApplicationController
    def show
      @user = User.friendly.find(params[:id])
      @softwares = @user.softwares
      @saved = Software.joins(:likes).where("likes.user_id=?", current_user.id) if @user == current_user
    end

    def create
      @user = User.new(user_params)
    
      respond_to do |format|
        if @user.save
    
          # Sends email to user when user is created.
          UserMailer.welcome_email(@user).deliver
    
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

end