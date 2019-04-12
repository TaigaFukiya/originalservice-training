class ToppagesController < ApplicationController
  def index
    if logged_in?
      @menu = current_user.menus.build
      @menus = current_user.menus.order('created_at DESC').page(params[:page])
    end
  end
end
