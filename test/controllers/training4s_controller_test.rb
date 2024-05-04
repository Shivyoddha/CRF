require "test_helper"

class Training4sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training4 = training4s(:one)
  end

  test "should get index" do
    get training4s_url
    assert_response :success
  end

  test "should get new" do
    get new_training4_url
    assert_response :success
  end

  test "should create training4" do
    assert_difference('Training4.count') do
      post training4s_url, params: { training4: {  } }
    end

    assert_redirected_to training4_url(Training4.last)
  end

  test "should show training4" do
    get training4_url(@training4)
    assert_response :success
  end

  test "should get edit" do
    get edit_training4_url(@training4)
    assert_response :success
  end

  test "should update training4" do
    patch training4_url(@training4), params: { training4: {  } }
    assert_redirected_to training4_url(@training4)
  end

  test "should destroy training4" do
    assert_difference('Training4.count', -1) do
      delete training4_url(@training4)
    end

    assert_redirected_to training4s_url
  end
end
