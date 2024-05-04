require "test_helper"

class Training3sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training3 = training3s(:one)
  end

  test "should get index" do
    get training3s_url
    assert_response :success
  end

  test "should get new" do
    get new_training3_url
    assert_response :success
  end

  test "should create training3" do
    assert_difference('Training3.count') do
      post training3s_url, params: { training3: {  } }
    end

    assert_redirected_to training3_url(Training3.last)
  end

  test "should show training3" do
    get training3_url(@training3)
    assert_response :success
  end

  test "should get edit" do
    get edit_training3_url(@training3)
    assert_response :success
  end

  test "should update training3" do
    patch training3_url(@training3), params: { training3: {  } }
    assert_redirected_to training3_url(@training3)
  end

  test "should destroy training3" do
    assert_difference('Training3.count', -1) do
      delete training3_url(@training3)
    end

    assert_redirected_to training3s_url
  end
end
