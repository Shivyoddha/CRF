require "test_helper"

class Training1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training1 = training1s(:one)
  end

  test "should get index" do
    get training1s_url
    assert_response :success
  end

  test "should get new" do
    get new_training1_url
    assert_response :success
  end

  test "should create training1" do
    assert_difference('Training1.count') do
      post training1s_url, params: { training1: {  } }
    end

    assert_redirected_to training1_url(Training1.last)
  end

  test "should show training1" do
    get training1_url(@training1)
    assert_response :success
  end

  test "should get edit" do
    get edit_training1_url(@training1)
    assert_response :success
  end

  test "should update training1" do
    patch training1_url(@training1), params: { training1: {  } }
    assert_redirected_to training1_url(@training1)
  end

  test "should destroy training1" do
    assert_difference('Training1.count', -1) do
      delete training1_url(@training1)
    end

    assert_redirected_to training1s_url
  end
end
