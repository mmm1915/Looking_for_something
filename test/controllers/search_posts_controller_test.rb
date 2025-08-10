require "test_helper"

class SearchPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_post = search_posts(:one) # fixturesを利用している場合
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
    post search_posts_path, params: { search_post: { item_name: "test item", status: 0 } }
    assert_response :redirect
  end

  test "should get edit" do
    get edit_search_post_path(@search_post)
    assert_response :success
  end

  test "should update search_post" do
    patch search_post_path(@search_post), params: { search_post: { item_name: "updated item" } }
    assert_response :redirect
  end
end
