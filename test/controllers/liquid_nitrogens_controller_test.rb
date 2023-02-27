require "test_helper"

class LiquidNitrogensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liquid_nitrogen = liquid_nitrogens(:one)
  end

  test "should get index" do
    get liquid_nitrogens_url
    assert_response :success
  end

  test "should get new" do
    get new_liquid_nitrogen_url
    assert_response :success
  end

  test "should create liquid_nitrogen" do
    assert_difference('LiquidNitrogen.count') do
      post liquid_nitrogens_url, params: { liquid_nitrogen: { debit: @liquid_nitrogen.debit, more: @liquid_nitrogen.more, purpose: @liquid_nitrogen.purpose, quantity: @liquid_nitrogen.quantity, slotdate: @liquid_nitrogen.slotdate, slottime: @liquid_nitrogen.slottime, status: @liquid_nitrogen.status } }
    end

    assert_redirected_to liquid_nitrogen_url(LiquidNitrogen.last)
  end

  test "should show liquid_nitrogen" do
    get liquid_nitrogen_url(@liquid_nitrogen)
    assert_response :success
  end

  test "should get edit" do
    get edit_liquid_nitrogen_url(@liquid_nitrogen)
    assert_response :success
  end

  test "should update liquid_nitrogen" do
    patch liquid_nitrogen_url(@liquid_nitrogen), params: { liquid_nitrogen: { debit: @liquid_nitrogen.debit, more: @liquid_nitrogen.more, purpose: @liquid_nitrogen.purpose, quantity: @liquid_nitrogen.quantity, slotdate: @liquid_nitrogen.slotdate, slottime: @liquid_nitrogen.slottime, status: @liquid_nitrogen.status } }
    assert_redirected_to liquid_nitrogen_url(@liquid_nitrogen)
  end

  test "should destroy liquid_nitrogen" do
    assert_difference('LiquidNitrogen.count', -1) do
      delete liquid_nitrogen_url(@liquid_nitrogen)
    end

    assert_redirected_to liquid_nitrogens_url
  end
end
