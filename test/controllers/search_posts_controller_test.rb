require "test_helper"

class SearchPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get search_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get search_posts_create_url
    assert_response :success
  end

  test "should get edit" do
    get search_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get search_posts_update_url
    assert_response :success
  end
end
