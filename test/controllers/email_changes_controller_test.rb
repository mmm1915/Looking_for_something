require "test_helper"

class EmailChangesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    sign_in @user
  end

  test "should get edit" do
    get email_changes_edit_url
    assert_response :success
  end

  test "should get update" do
    get email_changes_update_url
    assert_response :success
  end
end
