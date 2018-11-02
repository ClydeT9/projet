class SoftwaresController < ApplicationController
  before_action :set_software, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_editor!, except:[:index,:show]

  # GET /softwares
  # GET /softwares.json
  def index
    @softwares = Software.all.order("published_at desc")
  end

  # GET /softwares/1
  # GET /softwares/1.json
  def show
    @photos = @software.photos
  end

  def upload_photo
  end
  
  # GET /softwares/new
  def new
    @software = current_editor.softwares.build
  end

  # GET /softwares/1/edit
  def edit
    @photos = @software.photos
  end

  # POST /softwares
  # POST /softwares.json
  def create
    @software = current_editor.softwares.build(software_params)
    @software.published_at = Time.zone.now if publishing?

      if @software.save
        if params[:images]
            params[:images].each do |i|
                @software.photos.create(image: i)
            end
        end
        @photos = @software.photos
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
              @software.photos.create(image: i)
          end
      end
     redirect_to edit_software_path(@software), notice:"Modification enregistrée..."
 else
     render :edit
 end
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

private
    # Use callbacks to share common setup or constraints between actions.
    def set_software
      @software = Software.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def software_params
      params.require(:software).permit(:title, :video_url,:description, :software_url, :software_type,:facebook,:linkedin,:twitter, :slogan, :littledescription, :editeur, :logo)
    end

    def publishing?
      params[:commit] == "Publier"
    end

    def unpublishing?
      params[:commit] == "Annuler la publication"
    end
end
