require "test_helper"

class EmailChangesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    sign_in @user
  end

  test "should get edit" do
    get edit_email_change_path
    assert_response :success
  end

  test "should update email" do
    patch email_change_path, params: { user: { email: "new_email@example.com" } }
    @user.reload
    assert_equal "new_email@example.com", @user.email
    assert_redirected_to root_path
  end
end
