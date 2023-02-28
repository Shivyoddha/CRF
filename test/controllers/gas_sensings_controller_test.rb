require "test_helper"

class GasSensingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gas_sensing = gas_sensings(:one)
  end

  test "should get index" do
    get gas_sensings_url
    assert_response :success
  end

  test "should get new" do
    get new_gas_sensing_url
    assert_response :success
  end

  test "should create gas_sensing" do
    assert_difference('GasSensing.count') do
      post gas_sensings_url, params: { gas_sensing: { carcinogenic: @gas_sensing.carcinogenic, compatibility: @gas_sensing.compatibility, debit: @gas_sensing.debit, gas: @gas_sensing.gas, more: @gas_sensing.more, sample: @gas_sensing.sample, slotdate: @gas_sensing.slotdate, slottime: @gas_sensing.slottime, status: @gas_sensing.status, toxicity: @gas_sensing.toxicity } }
    end

    assert_redirected_to gas_sensing_url(GasSensing.last)
  end

  test "should show gas_sensing" do
    get gas_sensing_url(@gas_sensing)
    assert_response :success
  end

  test "should get edit" do
    get edit_gas_sensing_url(@gas_sensing)
    assert_response :success
  end

  test "should update gas_sensing" do
    patch gas_sensing_url(@gas_sensing), params: { gas_sensing: { carcinogenic: @gas_sensing.carcinogenic, compatibility: @gas_sensing.compatibility, debit: @gas_sensing.debit, gas: @gas_sensing.gas, more: @gas_sensing.more, sample: @gas_sensing.sample, slotdate: @gas_sensing.slotdate, slottime: @gas_sensing.slottime, status: @gas_sensing.status, toxicity: @gas_sensing.toxicity } }
    assert_redirected_to gas_sensing_url(@gas_sensing)
  end

  test "should destroy gas_sensing" do
    assert_difference('GasSensing.count', -1) do
      delete gas_sensing_url(@gas_sensing)
    end

    assert_redirected_to gas_sensings_url
  end
end
