require "test_helper"

class MicroEdmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micro_edm = micro_edms(:one)
  end

  test "should get index" do
    get micro_edms_url
    assert_response :success
  end

  test "should get new" do
    get new_micro_edm_url
    assert_response :success
  end

  test "should create micro_edm" do
    assert_difference('MicroEdm.count') do
      post micro_edms_url, params: { micro_edm: { composition: @micro_edm.composition, debit: @micro_edm.debit, drilling: @micro_edm.drilling, edg: @micro_edm.edg, edm: @micro_edm.edm, milling: @micro_edm.milling, more: @micro_edm.more, sample: @micro_edm.sample, slotdate: @micro_edm.slotdate, slottime: @micro_edm.slottime, status: @micro_edm.status, toolelectrode: @micro_edm.toolelectrode, toolmaterial: @micro_edm.toolmaterial, turning: @micro_edm.turning } }
    end

    assert_redirected_to micro_edm_url(MicroEdm.last)
  end

  test "should show micro_edm" do
    get micro_edm_url(@micro_edm)
    assert_response :success
  end

  test "should get edit" do
    get edit_micro_edm_url(@micro_edm)
    assert_response :success
  end

  test "should update micro_edm" do
    patch micro_edm_url(@micro_edm), params: { micro_edm: { composition: @micro_edm.composition, debit: @micro_edm.debit, drilling: @micro_edm.drilling, edg: @micro_edm.edg, edm: @micro_edm.edm, milling: @micro_edm.milling, more: @micro_edm.more, sample: @micro_edm.sample, slotdate: @micro_edm.slotdate, slottime: @micro_edm.slottime, status: @micro_edm.status, toolelectrode: @micro_edm.toolelectrode, toolmaterial: @micro_edm.toolmaterial, turning: @micro_edm.turning } }
    assert_redirected_to micro_edm_url(@micro_edm)
  end

  test "should destroy micro_edm" do
    assert_difference('MicroEdm.count', -1) do
      delete micro_edm_url(@micro_edm)
    end

    assert_redirected_to micro_edms_url
  end
end
