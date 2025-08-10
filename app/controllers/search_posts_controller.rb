class SearchPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search_post, only: [ :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @search_posts = SearchPost.includes(:user).all
  end

  def new
    @search_post = SearchPost.new
  end

  def create
    @search_post = current_user.search_posts.build(post_params)
    if @search_post.save
      redirect_to root_path, notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @search_post.update(post_params)
      redirect_to root_path, notice: "投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @search_post.destroy
    redirect_to root_path, notice: "投稿を削除しました"
  end

  def show
    @search_post = SearchPost.find(params[:id])
  end

  private

  def post_params
    params.require(:search_post).permit(:item_name, :status, :found_place)
  end

  def set_search_post
    @search_post = SearchPost.find(params[:id])
  end

  def authorize_user!
    redirect_to search_posts_path, alert: "ログインしてください" unless @search_post.user == current_user
  end
end
