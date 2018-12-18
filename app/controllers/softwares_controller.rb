class SoftwaresController < ApplicationController
  before_action :set_software, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index,:show]
  after_action :send_software_email

  # GET /softwares
  # GET /softwares.json
  def index
    @softwares = Software.includes(:comment_threads).paginate(:page => params[:page], :per_page => 14).order("published_at desc")
  end

  # GET /softwares/1
  # GET /softwares/1.json
  def show
    @software = Software.find(params[:id])
    # @software = Software.friendly.find(params[:id])
    @is_liked = @software.is_liked(current_user) if user_signed_in?
    @comment = Comment.build_from(@software, current_user.id, '') if user_signed_in?
    respond_to do |format|
      format.html
      format.js
    end
  end

  def upload_photo
  end
  
  # GET /softwares/new
  def new
    @software = current_user.softwares.build
  end

  # GET /softwares/1/edit
  def edit
  end

  # POST /softwares
  # POST /softwares.json
  def create
    @software = current_user.softwares.build(software_params)
    @software.published_at = Time.zone.now if publishing?

      if @software.save
        if params[:images]
            params[:images].each do |i|
            end
        end
        redirect_to edit_software_path(@software), notice:"Votre logiciel a été ajouté avec succès" 
  else
       render :new
  end
  end

  # PATCH/PUT /softwares/1
  # PATCH/PUT /softwares/1.json
  def update
    @software.published_at = Time.zone.now if publishing?
    @software.published_at = nil if unpublishing?

    if @software.update(software_params)
      if params[:images]
          params[:images].each do |i|
          end
      end
     redirect_to edit_software_path(@software), notice:"Modification enregistrée..."
 else
     render :edit
 end
  end

  def send_software_email
    UserMailer.send_software_email(@user).deliver
  end

  # DELETE /softwares/1
  # DELETE /softwares/1.json
  def destroy
    @software.destroy
    respond_to do |format|
      format.html { redirect_to softwares_url, notice: 'Le logiciel a été détruit avec succès.' }
      format.json { head :no_content }
    end
  end
  
  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: softwares_path)
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_software
      @software = Software.find(params[:id])
      # @software = Software.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def software_params
      params.require(:software).permit(:title, :software_type, :video_url,:description, :software_url, :software_type,:facebook,:linkedin,:twitter, :slogan, :editeur, :logo, :target, category_ids: [],images: [])
    end

    def publishing?
      params[:commit] == "Publier"
    end

    def unpublishing?
      params[:commit] == "Annuler la publication"
    end
end
