require "test_helper"

class GlowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glow = glows(:one)
  end

  test "should get index" do
    get glows_url
    assert_response :success
  end

  test "should get new" do
    get new_glow_url
    assert_response :success
  end

  test "should create glow" do
    assert_difference('Glow.count') do
      post glows_url, params: { glow: { coated: @glow.coated, coated_ele: @glow.coated_ele, debit: @glow.debit, elemental: @glow.elemental, more: @glow.more, sample: @glow.sample, slotdate: @glow.slotdate, slottime: @glow.slottime, specification: @glow.specification, status: @glow.status, substarte: @glow.substarte } }
    end

    assert_redirected_to glow_url(Glow.last)
  end

  test "should show glow" do
    get glow_url(@glow)
    assert_response :success
  end

  test "should get edit" do
    get edit_glow_url(@glow)
    assert_response :success
  end

  test "should update glow" do
    patch glow_url(@glow), params: { glow: { coated: @glow.coated, coated_ele: @glow.coated_ele, debit: @glow.debit, elemental: @glow.elemental, more: @glow.more, sample: @glow.sample, slotdate: @glow.slotdate, slottime: @glow.slottime, specification: @glow.specification, status: @glow.status, substarte: @glow.substarte } }
    assert_redirected_to glow_url(@glow)
  end

  test "should destroy glow" do
    assert_difference('Glow.count', -1) do
      delete glow_url(@glow)
    end

    assert_redirected_to glows_url
  end
end
