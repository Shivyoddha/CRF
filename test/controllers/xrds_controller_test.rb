require "test_helper"

class XrdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xrd = xrds(:one)
  end

  test "should get index" do
    get xrds_url
    assert_response :success
  end

  test "should get new" do
    get new_xrd_url
    assert_response :success
  end

  test "should create xrd" do
    assert_difference("Xrd.count") do
      post xrds_url, params: { xrd: { composition: @xrd.composition, maxd: @xrd.maxd, measurement: @xrd.measurement, mind: @xrd.mind, more: @xrd.more, reference: @xrd.reference, sample: @xrd.sample, stype: @xrd.stype } }
    end

    assert_redirected_to xrd_url(Xrd.last)
  end

  test "should show xrd" do
    get xrd_url(@xrd)
    assert_response :success
  end

  test "should get edit" do
    get edit_xrd_url(@xrd)
    assert_response :success
  end

  test "should update xrd" do
    patch xrd_url(@xrd), params: { xrd: { composition: @xrd.composition, maxd: @xrd.maxd, measurement: @xrd.measurement, mind: @xrd.mind, more: @xrd.more, reference: @xrd.reference, sample: @xrd.sample, stype: @xrd.stype } }
    assert_redirected_to xrd_url(@xrd)
  end

  test "should destroy xrd" do
    assert_difference("Xrd.count", -1) do
      delete xrd_url(@xrd)
    end

    assert_redirected_to xrds_url
  end
end
