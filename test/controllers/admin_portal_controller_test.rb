require "test_helper"

class AdminPortalControllerTest < ActionDispatch::IntegrationTest
  test "should get admindashboard" do
    get admin_portal_admindashboard_url
    assert_response :success
  end
end
