class LikesController < ApplicationController
    before_action :authenticate_user!

    def index
      @softwareslike = current_user.find_up_voted_items
    end
end