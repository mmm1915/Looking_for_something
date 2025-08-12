class HomeController < ApplicationController
  def index
    @search_posts = SearchPost.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end
end
