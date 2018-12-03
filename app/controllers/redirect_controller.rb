class RedirectController < ApplicationController
    def index
      redirect_to :root, :status => :moved_permanently
    end
  end