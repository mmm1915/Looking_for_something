require "test_helper"

class SearchPostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # これも念のため追記

  setup do
    @user = users(:one) # fixtures/users.yml のユーザー名に合わせる
    sign_in @user
    @search_post = search_posts(:one) # 編集系テストで使う既存投稿があれば
  end

  test "should get index" do
    get search_posts_path
    assert_response :success
  end

  test "should get new" do
    get new_search_post_path
    assert_response :success
  end

  test "should create search_post" do
    post search_posts_path, params: { search_post: { item_name: "test item", status: "searching" } }
    assert_redirected_to root_path
  end

  test "should get edit" do
    get edit_search_post_path(@search_post)
    assert_response :success
  end

  test "should update search_post" do
    patch search_post_path(@search_post), params: { search_post: { item_name: "updated" } }
    assert_redirected_to root_path
  end
end
