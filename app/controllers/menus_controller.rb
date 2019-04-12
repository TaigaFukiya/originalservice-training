class MenusController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      flash[:success] = 'メニューを追加しました。'
      redirect_to root_url
    else
      @menus = current_user.menus.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メニューの追加に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @menu.destroy
    flash[:success] = 'メニューを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def menu_params
    params.require(:menu).permit(:content)
  end
  
  def correct_user
    @menu = current_user.menus.find_by(id: params[:id])
    unless @menu
      redirect_to root_url
    end
  end
end
