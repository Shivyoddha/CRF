require "test_helper"

class IntegratedMultiRoleTestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @integrated_multi_role_tester = integrated_multi_role_testers(:one)
  end

  test "should get index" do
    get integrated_multi_role_testers_url
    assert_response :success
  end

  test "should get new" do
    get new_integrated_multi_role_tester_url
    assert_response :success
  end

  test "should create integrated_multi_role_tester" do
    assert_difference("IntegratedMultiRoleTester.count") do
      post integrated_multi_role_testers_url, params: { integrated_multi_role_tester: { analysis: @integrated_multi_role_tester.analysis, loading: @integrated_multi_role_tester.loading, measurement: @integrated_multi_role_tester.measurement, more: @integrated_multi_role_tester.more, sample: @integrated_multi_role_tester.sample, temperature: @integrated_multi_role_tester.temperature, type: @integrated_multi_role_tester.type } }
    end

    assert_redirected_to integrated_multi_role_tester_url(IntegratedMultiRoleTester.last)
  end

  test "should show integrated_multi_role_tester" do
    get integrated_multi_role_tester_url(@integrated_multi_role_tester)
    assert_response :success
  end

  test "should get edit" do
    get edit_integrated_multi_role_tester_url(@integrated_multi_role_tester)
    assert_response :success
  end

  test "should update integrated_multi_role_tester" do
    patch integrated_multi_role_tester_url(@integrated_multi_role_tester), params: { integrated_multi_role_tester: { analysis: @integrated_multi_role_tester.analysis, loading: @integrated_multi_role_tester.loading, measurement: @integrated_multi_role_tester.measurement, more: @integrated_multi_role_tester.more, sample: @integrated_multi_role_tester.sample, temperature: @integrated_multi_role_tester.temperature, type: @integrated_multi_role_tester.type } }
    assert_redirected_to integrated_multi_role_tester_url(@integrated_multi_role_tester)
  end

  test "should destroy integrated_multi_role_tester" do
    assert_difference("IntegratedMultiRoleTester.count", -1) do
      delete integrated_multi_role_tester_url(@integrated_multi_role_tester)
    end

    assert_redirected_to integrated_multi_role_testers_url
  end
end
