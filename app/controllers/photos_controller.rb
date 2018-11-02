class PhotosController < ApplicationController

  def new
  	@photo = Photo.new
  end

  def destroy
      @photo = Photo.find(params[:id])
      software = @photo.software
      
      @photo.destroy
      @photos = Photo.where(software_id: software.id)
      
      respond_to :js
  end
  
end