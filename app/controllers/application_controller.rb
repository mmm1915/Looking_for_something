class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_search

  def index
    render plain: "Hello Rails!"
  end

  private

  def set_search
    @q = SearchPost.ransack(params[:q])
  end
end
