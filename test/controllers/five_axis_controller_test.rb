require "test_helper"

class FiveAxisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @five_axi = five_axis(:one)
  end

  test "should get index" do
    get five_axis_url
    assert_response :success
  end

  test "should get new" do
    get new_five_axi_url
    assert_response :success
  end

  test "should create five_axi" do
    assert_difference('FiveAxi.count') do
      post five_axis_url, params: { five_axi: { cncprogram: @five_axi.cncprogram, debit: @five_axi.debit, depth: @five_axi.depth, feedrate: @five_axi.feedrate, material: @five_axi.material, more: @five_axi.more, operation: @five_axi.operation, rotationalspeed: @five_axi.rotationalspeed, sample: @five_axi.sample, slotdate: @five_axi.slotdate, slottime: @five_axi.slottime, specimentolerance: @five_axi.specimentolerance, status: @five_axi.status, tool: @five_axi.tool } }
    end

    assert_redirected_to five_axi_url(FiveAxi.last)
  end

  test "should show five_axi" do
    get five_axi_url(@five_axi)
    assert_response :success
  end

  test "should get edit" do
    get edit_five_axi_url(@five_axi)
    assert_response :success
  end

  test "should update five_axi" do
    patch five_axi_url(@five_axi), params: { five_axi: { cncprogram: @five_axi.cncprogram, debit: @five_axi.debit, depth: @five_axi.depth, feedrate: @five_axi.feedrate, material: @five_axi.material, more: @five_axi.more, operation: @five_axi.operation, rotationalspeed: @five_axi.rotationalspeed, sample: @five_axi.sample, slotdate: @five_axi.slotdate, slottime: @five_axi.slottime, specimentolerance: @five_axi.specimentolerance, status: @five_axi.status, tool: @five_axi.tool } }
    assert_redirected_to five_axi_url(@five_axi)
  end

  test "should destroy five_axi" do
    assert_difference('FiveAxi.count', -1) do
      delete five_axi_url(@five_axi)
    end

    assert_redirected_to five_axis_url
  end
end
