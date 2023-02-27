require "test_helper"

class SpectroRadioMetersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spectro_radio_meter = spectro_radio_meters(:one)
  end

  test "should get index" do
    get spectro_radio_meters_url
    assert_response :success
  end

  test "should get new" do
    get new_spectro_radio_meter_url
    assert_response :success
  end

  test "should create spectro_radio_meter" do
    assert_difference('SpectroRadioMeter.count') do
      post spectro_radio_meters_url, params: { spectro_radio_meter: { application: @spectro_radio_meter.application, debit: @spectro_radio_meter.debit, more: @spectro_radio_meter.more, nature: @spectro_radio_meter.nature, sample: @spectro_radio_meter.sample, slotdate: @spectro_radio_meter.slotdate, slottime: @spectro_radio_meter.slottime, status: @spectro_radio_meter.status, stype: @spectro_radio_meter.stype } }
    end

    assert_redirected_to spectro_radio_meter_url(SpectroRadioMeter.last)
  end

  test "should show spectro_radio_meter" do
    get spectro_radio_meter_url(@spectro_radio_meter)
    assert_response :success
  end

  test "should get edit" do
    get edit_spectro_radio_meter_url(@spectro_radio_meter)
    assert_response :success
  end

  test "should update spectro_radio_meter" do
    patch spectro_radio_meter_url(@spectro_radio_meter), params: { spectro_radio_meter: { application: @spectro_radio_meter.application, debit: @spectro_radio_meter.debit, more: @spectro_radio_meter.more, nature: @spectro_radio_meter.nature, sample: @spectro_radio_meter.sample, slotdate: @spectro_radio_meter.slotdate, slottime: @spectro_radio_meter.slottime, status: @spectro_radio_meter.status, stype: @spectro_radio_meter.stype } }
    assert_redirected_to spectro_radio_meter_url(@spectro_radio_meter)
  end

  test "should destroy spectro_radio_meter" do
    assert_difference('SpectroRadioMeter.count', -1) do
      delete spectro_radio_meter_url(@spectro_radio_meter)
    end

    assert_redirected_to spectro_radio_meters_url
  end
end
