class BooksController < ApplicationController

  # ----------------------------------------------------------------------------
  # Settings
  # ----------------------------------------------------------------------------
  protect_from_forgery except: [:destroy]

  # ----------------------------------------------------------------------------
  # Hooks
  # ----------------------------------------------------------------------------
  # 実行前
  before_action :set_book, only: [:show, :destroy]
  #before_action do
  #  redirect_to "/" if params[:token].blank?
  #end

  # 実行前後
  around_action :action_logger, only: [:destroy]

  #after_action 実行後

  # ----------------------------------------------------------------------------
  # Controller Method
  # ----------------------------------------------------------------------------
  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @book.destroy # @はインスタンス変数
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  # privateメソッド
  private

  def set_book
    @book = Book.find(params[:id])
  end

  def action_logger
    logger.info "around-before"
    yield
    logger.info "around-after"
  end

end
