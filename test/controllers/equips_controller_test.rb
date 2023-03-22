require "test_helper"

class EquipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get equips_index_url
    assert_response :success
  end

  test "should get show" do
    get equips_show_url
    assert_response :success
  end

  test "should get new" do
    get equips_new_url
    assert_response :success
  end

  test "should get create" do
    get equips_create_url
    assert_response :success
  end

  test "should get destroy" do
    get equips_destroy_url
    assert_response :success
  end
end
