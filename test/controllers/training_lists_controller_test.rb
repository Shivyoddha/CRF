require "test_helper"

class TrainingListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_list = training_lists(:one)
  end

  test "should get index" do
    get training_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_training_list_url
    assert_response :success
  end

  test "should create training_list" do
    assert_difference('TrainingList.count') do
      post training_lists_url, params: { training_list: { name: @training_list.name } }
    end

    assert_redirected_to training_list_url(TrainingList.last)
  end

  test "should show training_list" do
    get training_list_url(@training_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_training_list_url(@training_list)
    assert_response :success
  end

  test "should update training_list" do
    patch training_list_url(@training_list), params: { training_list: { name: @training_list.name } }
    assert_redirected_to training_list_url(@training_list)
  end

  test "should destroy training_list" do
    assert_difference('TrainingList.count', -1) do
      delete training_list_url(@training_list)
    end

    assert_redirected_to training_lists_url
  end
end
