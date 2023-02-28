require "test_helper"

class FrictionStirsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friction_stir = friction_stirs(:one)
  end

  test "should get index" do
    get friction_stirs_url
    assert_response :success
  end

  test "should get new" do
    get new_friction_stir_url
    assert_response :success
  end

  test "should create friction_stir" do
    assert_difference('FrictionStir.count') do
      post friction_stirs_url, params: { friction_stir: { debit: @friction_stir.debit, depth: @friction_stir.depth, material: @friction_stir.material, measurement: @friction_stir.measurement, more: @friction_stir.more, otforce: @friction_stir.otforce, pstype: @friction_stir.pstype, ptforce: @friction_stir.ptforce, rspeed: @friction_stir.rspeed, sample: @friction_stir.sample, slotdate: @friction_stir.slotdate, slottime: @friction_stir.slottime, status: @friction_stir.status, tool: @friction_stir.tool, toolnom: @friction_stir.toolnom, wspeed: @friction_stir.wspeed, wtemp: @friction_stir.wtemp } }
    end

    assert_redirected_to friction_stir_url(FrictionStir.last)
  end

  test "should show friction_stir" do
    get friction_stir_url(@friction_stir)
    assert_response :success
  end

  test "should get edit" do
    get edit_friction_stir_url(@friction_stir)
    assert_response :success
  end

  test "should update friction_stir" do
    patch friction_stir_url(@friction_stir), params: { friction_stir: { debit: @friction_stir.debit, depth: @friction_stir.depth, material: @friction_stir.material, measurement: @friction_stir.measurement, more: @friction_stir.more, otforce: @friction_stir.otforce, pstype: @friction_stir.pstype, ptforce: @friction_stir.ptforce, rspeed: @friction_stir.rspeed, sample: @friction_stir.sample, slotdate: @friction_stir.slotdate, slottime: @friction_stir.slottime, status: @friction_stir.status, tool: @friction_stir.tool, toolnom: @friction_stir.toolnom, wspeed: @friction_stir.wspeed, wtemp: @friction_stir.wtemp } }
    assert_redirected_to friction_stir_url(@friction_stir)
  end

  test "should destroy friction_stir" do
    assert_difference('FrictionStir.count', -1) do
      delete friction_stir_url(@friction_stir)
    end

    assert_redirected_to friction_stirs_url
  end
end
