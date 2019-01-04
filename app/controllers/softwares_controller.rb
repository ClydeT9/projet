class SoftwaresController < ApplicationController
  before_action :set_software, only: [:show, :edit, :update, :stat, :destroy, :upvote]
  before_action :authenticate_user!, except:[:index,:show]
  before_action :require_same_user, only: [:edit, :update, :stat]
  after_action :send_software_email, only: [:create, :update]
  impressionist :actions => [:show]

  # GET /softwares
  # GET /softwares.json
  def index
    @softwares = Software.includes(:comment_threads).paginate(:page => params[:page], :per_page => 25).order("published_at desc")
  end

  # GET /softwares/1
  # GET /softwares/1.json
  def show
    @software = Software.friendly.find(params[:id])
    @related_softwares = Software.joins(:categories).where('softwares.id != ?', @software.id).where(software_categories: {category_id: @software.category_ids}).limit(4).distinct
    impressionist(@software)
    @is_liked = @software.is_liked(current_user) if user_signed_in?
    @comment = Comment.build_from(@software, current_user.id, '') if user_signed_in?
    respond_to do |format|
      format.html
      format.js
    end
    set_meta_tags title: @software.slogan,
                  site: @software.title,
                  description: @software.slogan
  end

  def upload_photo
  end

  def stat
    @softwares = current_user.softwares
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

  def upvote
    if !current_user.liked? @software
      @software.liked_by current_user
    elsif current_user.liked? @software
      @software.unliked_by current_user 
    end
    respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js 
        end
  end 

private
    # Use callbacks to share common setup or constraints between actions.
    def set_software
      #@software = Software.find(params[:id])
      @software = Software.friendly.find(params[:id])
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
    
    def require_same_user
      if current_user.id != @software.user_id
          flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
          redirect_to root_path
      end
    end

end
