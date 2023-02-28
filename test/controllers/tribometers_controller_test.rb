require "test_helper"

class TribometersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tribometer = tribometers(:one)
  end

  test "should get index" do
    get tribometers_url
    assert_response :success
  end

  test "should get new" do
    get new_tribometer_url
    assert_response :success
  end

  test "should create tribometer" do
    assert_difference('Tribometer.count') do
      post tribometers_url, params: { tribometer: { indenter: @tribometer.indenter, loading: @tribometer.loading, measurement: @tribometer.measurement, more: @tribometer.more, sample: @tribometer.sample, stroke: @tribometer.stroke, stype: @tribometer.stype, temp_req: @tribometer.temp_req } }
    end

    assert_redirected_to tribometer_url(Tribometer.last)
  end

  test "should show tribometer" do
    get tribometer_url(@tribometer)
    assert_response :success
  end

  test "should get edit" do
    get edit_tribometer_url(@tribometer)
    assert_response :success
  end

  test "should update tribometer" do
    patch tribometer_url(@tribometer), params: { tribometer: { indenter: @tribometer.indenter, loading: @tribometer.loading, measurement: @tribometer.measurement, more: @tribometer.more, sample: @tribometer.sample, stroke: @tribometer.stroke, stype: @tribometer.stype, temp_req: @tribometer.temp_req } }
    assert_redirected_to tribometer_url(@tribometer)
  end

  test "should destroy tribometer" do
    assert_difference('Tribometer.count', -1) do
      delete tribometer_url(@tribometer)
    end

    assert_redirected_to tribometers_url
  end
end
