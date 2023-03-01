require "test_helper"

class FrictionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friction = frictions(:one)
  end

  test "should get index" do
    get frictions_url
    assert_response :success
  end

  test "should get new" do
    get new_friction_url
    assert_response :success
  end

  test "should create friction" do
    assert_difference('Friction.count') do
      post frictions_url, params: { friction: { debit: @friction.debit, depth: @friction.depth, material: @friction.material, measurement: @friction.measurement, more: @friction.more, otforce: @friction.otforce, pstype: @friction.pstype, ptforce: @friction.ptforce, rspeed: @friction.rspeed, sample: @friction.sample, slotdate: @friction.slotdate, slottime: @friction.slottime, status: @friction.status, tool: @friction.tool, toolnom: @friction.toolnom, wspeed: @friction.wspeed, wtemp: @friction.wtemp } }
    end

    assert_redirected_to friction_url(Friction.last)
  end

  test "should show friction" do
    get friction_url(@friction)
    assert_response :success
  end

  test "should get edit" do
    get edit_friction_url(@friction)
    assert_response :success
  end

  test "should update friction" do
    patch friction_url(@friction), params: { friction: { debit: @friction.debit, depth: @friction.depth, material: @friction.material, measurement: @friction.measurement, more: @friction.more, otforce: @friction.otforce, pstype: @friction.pstype, ptforce: @friction.ptforce, rspeed: @friction.rspeed, sample: @friction.sample, slotdate: @friction.slotdate, slottime: @friction.slottime, status: @friction.status, tool: @friction.tool, toolnom: @friction.toolnom, wspeed: @friction.wspeed, wtemp: @friction.wtemp } }
    assert_redirected_to friction_url(@friction)
  end

  test "should destroy friction" do
    assert_difference('Friction.count', -1) do
      delete friction_url(@friction)
    end

    assert_redirected_to frictions_url
  end
end
