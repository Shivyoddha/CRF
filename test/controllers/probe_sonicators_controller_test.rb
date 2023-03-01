require "test_helper"

class ProbeSonicatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @probe_sonicator = probe_sonicators(:one)
  end

  test "should get index" do
    get probe_sonicators_url
    assert_response :success
  end

  test "should get new" do
    get new_probe_sonicator_url
    assert_response :success
  end

  test "should create probe_sonicator" do
    assert_difference('ProbeSonicator.count') do
      post probe_sonicators_url, params: { probe_sonicator: { amplitude: @probe_sonicator.amplitude, debit: @probe_sonicator.debit, more: @probe_sonicator.more, sample: @probe_sonicator.sample, size: @probe_sonicator.size, slotdate: @probe_sonicator.slotdate, slottime: @probe_sonicator.slottime, status: @probe_sonicator.status, viscosity: @probe_sonicator.viscosity, volume: @probe_sonicator.volume } }
    end

    assert_redirected_to probe_sonicator_url(ProbeSonicator.last)
  end

  test "should show probe_sonicator" do
    get probe_sonicator_url(@probe_sonicator)
    assert_response :success
  end

  test "should get edit" do
    get edit_probe_sonicator_url(@probe_sonicator)
    assert_response :success
  end

  test "should update probe_sonicator" do
    patch probe_sonicator_url(@probe_sonicator), params: { probe_sonicator: { amplitude: @probe_sonicator.amplitude, debit: @probe_sonicator.debit, more: @probe_sonicator.more, sample: @probe_sonicator.sample, size: @probe_sonicator.size, slotdate: @probe_sonicator.slotdate, slottime: @probe_sonicator.slottime, status: @probe_sonicator.status, viscosity: @probe_sonicator.viscosity, volume: @probe_sonicator.volume } }
    assert_redirected_to probe_sonicator_url(@probe_sonicator)
  end

  test "should destroy probe_sonicator" do
    assert_difference('ProbeSonicator.count', -1) do
      delete probe_sonicator_url(@probe_sonicator)
    end

    assert_redirected_to probe_sonicators_url
  end
end
