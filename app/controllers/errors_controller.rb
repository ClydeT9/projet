class ErrorsController < ApplicationController
    before_action :authenticate_user!, except: [:error404]
    def error404
      render status: :not_found
    end
  end