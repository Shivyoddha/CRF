require "test_helper"

class EquiplistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equiplist = equiplists(:one)
  end

  test "should get index" do
    get equiplists_url
    assert_response :success
  end

  test "should get new" do
    get new_equiplist_url
    assert_response :success
  end

  test "should create equiplist" do
    assert_difference('Equiplist.count') do
      post equiplists_url, params: { equiplist: { calibrate: @equiplist.calibrate, name: @equiplist.name, status: @equiplist.status } }
    end

    assert_redirected_to equiplist_url(Equiplist.last)
  end

  test "should show equiplist" do
    get equiplist_url(@equiplist)
    assert_response :success
  end

  test "should get edit" do
    get edit_equiplist_url(@equiplist)
    assert_response :success
  end

  test "should update equiplist" do
    patch equiplist_url(@equiplist), params: { equiplist: { calibrate: @equiplist.calibrate, name: @equiplist.name, status: @equiplist.status } }
    assert_redirected_to equiplist_url(@equiplist)
  end

  test "should destroy equiplist" do
    assert_difference('Equiplist.count', -1) do
      delete equiplist_url(@equiplist)
    end

    assert_redirected_to equiplists_url
  end
end
