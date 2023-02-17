require "test_helper"

class IcpMsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icp_m = icp_ms(:one)
  end

  test "should get index" do
    get icp_ms_url
    assert_response :success
  end

  test "should get new" do
    get new_icp_m_url
    assert_response :success
  end

  test "should create icp_m" do
    assert_difference("IcpM.count") do
      post icp_ms_url, params: { icp_m: { compatibility: @icp_m.compatibility, composition: @icp_m.composition, concentration: @icp_m.concentration, hazard: @icp_m.hazard, more: @icp_m.more, nature: @icp_m.nature, sample: @icp_m.sample, sample_phase: @icp_m.sample_phase, storage: @icp_m.storage, testing: @icp_m.testing, toxicity: @icp_m.toxicity } }
    end

    assert_redirected_to icp_m_url(IcpM.last)
  end

  test "should show icp_m" do
    get icp_m_url(@icp_m)
    assert_response :success
  end

  test "should get edit" do
    get edit_icp_m_url(@icp_m)
    assert_response :success
  end

  test "should update icp_m" do
    patch icp_m_url(@icp_m), params: { icp_m: { compatibility: @icp_m.compatibility, composition: @icp_m.composition, concentration: @icp_m.concentration, hazard: @icp_m.hazard, more: @icp_m.more, nature: @icp_m.nature, sample: @icp_m.sample, sample_phase: @icp_m.sample_phase, storage: @icp_m.storage, testing: @icp_m.testing, toxicity: @icp_m.toxicity } }
    assert_redirected_to icp_m_url(@icp_m)
  end

  test "should destroy icp_m" do
    assert_difference("IcpM.count", -1) do
      delete icp_m_url(@icp_m)
    end

    assert_redirected_to icp_ms_url
  end
end
