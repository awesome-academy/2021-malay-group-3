require "test_helper"

class AppliesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get applies_edit_url
    assert_response :success
  end
end
