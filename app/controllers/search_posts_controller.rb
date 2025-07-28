class SearchPostsController < ApplicationController
  def index
    @search_posts = SearchPost.all
  end

  def new
    @search_post = SearchPost.new
  end

  def create
    @search_post = current_user.search_posts.build(post_params)
    if @search_post.save
      redirect_to search_posts_path, notice: "投稿を作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:search_post).permit(:title, :body)
  end
end
