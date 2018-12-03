class ContactsController < ApplicationController
    before_action :authenticate_user!, except:[:create,:new]
    def new
      @contact = Contact.new
    end
  
    def create
      @contact = Contact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
      else
        notice:"Impossible d\'envoyer un message." 
        render :new
      end
    end
  end