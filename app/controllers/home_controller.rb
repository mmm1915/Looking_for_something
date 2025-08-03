class HomeController < ApplicationController
  def index
    @search_posts = SearchPost.includes(:user).order(created_at: :desc)
  end
end
