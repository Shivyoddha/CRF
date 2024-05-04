require "test_helper"

class Training2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training2 = training2s(:one)
  end

  test "should get index" do
    get training2s_url
    assert_response :success
  end

  test "should get new" do
    get new_training2_url
    assert_response :success
  end

  test "should create training2" do
    assert_difference('Training2.count') do
      post training2s_url, params: { training2: {  } }
    end

    assert_redirected_to training2_url(Training2.last)
  end

  test "should show training2" do
    get training2_url(@training2)
    assert_response :success
  end

  test "should get edit" do
    get edit_training2_url(@training2)
    assert_response :success
  end

  test "should update training2" do
    patch training2_url(@training2), params: { training2: {  } }
    assert_redirected_to training2_url(@training2)
  end

  test "should destroy training2" do
    assert_difference('Training2.count', -1) do
      delete training2_url(@training2)
    end

    assert_redirected_to training2s_url
  end
end
